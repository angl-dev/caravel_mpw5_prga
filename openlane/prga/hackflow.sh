if [ "`uname -n`" != "eldin" ] || [ "$USER" != "angl" ]; then
    echo "This script only works for angl@eldin"
    exit
fi

function cleanup {
    pushd caravel
    git checkout openlane/Makefile
    popd
    popd
}

trap cleanup EXIT

# 1. cd to project root
pushd ${TAPEOUT_ROOT}/caravel

# 2. hack caravel/openlane/Makefile
git checkout caravel/openlane/Makefile
sed -i "/^OPENLANE_BASIC_COMMAND/c\OPENLANE_BASIC_COMMAND = \"cd \$(PWD)/../openlane && flow.tcl -design ./\$* -save_path .. -save -tag \$* -overwrite -to cts\"" \
    caravel/openlane/Makefile

# 3. run make
make prga
if [[ -z "$?" ]]; then
    echo "Make to cts failed"
    exit
fi

# 4. run hacked openroad to route
pushd openlane
OPENROAD_BIN=/home/angl/local/bin/openroad \
    CARAVEL_ROOT=../caravel \
    ../../openlane/flow.tcl \
    -design prga \
    -tag prga \
    -save \
    -save_path .. \
    -from routing \
    -to routing
# somehow we need to run it twice.. I guess this is due to some configuration
# file overriding rules
OPENROAD_BIN=/home/angl/local/bin/openroad \
    CARAVEL_ROOT=../caravel \
    ../../openlane/flow.tcl \
    -design prga \
    -tag prga \
    -save \
    -save_path .. \
    -from routing \
    -to routing
popd

# 5. hack Makefile again
sed -i "/^OPENLANE_BASIC_COMMAND/c\OPENLANE_BASIC_COMMAND = \"cd \$(PWD)/../openlane && flow.tcl -design ./\$* -save_path .. -save -tag \$* -from eco\"" \
    caravel/openlane/Makefile

# 6. run make
make prga
# similarly, we need it run it twice
make prga
if [[ -z "$?" ]]; then
    echo "Make from eco failed"
fi

# 7. revert our hack of the Makefile
exit
