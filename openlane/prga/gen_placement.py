import os
import math
import sys
from itertools import product

script_dir = os.path.dirname (os.path.abspath(__file__))

site_width  = 0.46
site_height = 2.72

top_left_margin_mult    =  12
top_right_margin_mult   =  12
top_top_margin_mult     =  4
top_bottom_margin_mult  =  4

top_voffset =  16.32    # horizontal offset of vertical strips
top_vpitch  =  51.20    # horizontal pitch of vertical strips
                        # this is VDD-to-VDD, i.e. there's a GND at half top_vpitch
top_vwidth  =   1.60    # width of the vertical strips
top_vspace  =   1.70    # min spacing between any vertical PDN
top_hoffset =  16.65    # vertical offset of horizontal strips
top_hpitch  = 153.18    # vertical pitch of horizontal strips
top_hwidth  =   1.60    # width of the horizontal strips
top_hspace  =   1.70    # min spacing between any horizontal PDN

# Vertical multiplier
vmult = 2.5

# the goal is to place one CLB every (2*top_vpitch, vmult*top_hpitch)
num_clb_x   = 9
num_clb_y   = 9

# Get PDN shapes in tile_clb
def get_clb_pdn_met4 ():
    pdn = []
    found_met4 = False

    for lineno, line in enumerate(
            open(os.path.join(script_dir, "..", "..", "lef", "tile_clb.lef")),
            1):
        tokens = line.split()

        if found_met4:
            found_met4 = False
            try:
                pdn.append (tuple(map(float, tokens[1:5])))
            except (IndexError, ValueError):
                raise RuntimeError ("[LINE {:>06d}] Expecting 'RECT %f %f %f %f ;'".format(lineno))

        else:
            if len(tokens) >= 2 and tokens[0] == "LAYER" and tokens[1] == "met4":
                found_met4 = True

    return list(sorted(pdn, key = lambda x: x[0]))

# Analyze PDN shapes: reverse-engineer the horizontal offset, pitch and width of the vertical strips of PDN
def analyze_pdn (pdn):
    if len(pdn) < 2:
        raise RuntimeError("At least 2 PDN shapes are required for analysis")

    strips = [ ((shape[0] + shape[2])/2., (shape[2] - shape[0])/2.)
            for shape in pdn ]
    strips = sorted(strips, key = lambda x: x[0])

    offset = strips[0][0]
    pitch = strips[1][0] - offset
    width = strips[0][1]
    for i, strip in enumerate(strips):
        if i < len(strip) - 1:
            if abs(strips[i+1][0] - strip[0] - pitch) > 1e-10:
                raise RuntimeError("Inconsistent pitch")
        if abs(strip[1] - width) > 1e-10:
            raise RuntimeError("Inconsistent width")

    return offset, pitch, width

# Validate horizontal placement
def validate_hplace ( macro_hoffset, macro_pdn ):
    # top grid:
    #   
    #   for any integer __k__:
    #       top_left_margin_mult * site_width
    #       + top_voffset
    #       + __k__ * top_vpitch / 2
    x_top_pdn_met4 = top_left_margin_mult * site_width + top_voffset

    for x in range(num_clb_x):
        for x0, _0, x1, _1 in macro_pdn:
            x0 += macro_hoffset + x * top_vpitch * 2
            x1 += macro_hoffset + x * top_vpitch * 2 

            left_space = (x0 - x_top_pdn_met4)
            left_space -= math.floor(2 * left_space / top_vpitch) * top_vpitch / 2
            if left_space < top_vwidth / 2 + top_vspace:
                raise RuntimeError("[Error] PDN conflict at {:g}".format(x0))

            right_space = (x1 - x_top_pdn_met4)
            right_space -= math.floor(2 * right_space / top_vpitch) * top_vpitch / 2
            right_space = top_vpitch / 2 - right_space
            if right_space < top_vwidth / 2 + top_vspace:
                raise RuntimeError("[Error] PDN conflict at {:g}".format(x0))

if __name__ == '__main__':
    if len(sys.argv) < 4:
        raise RuntimeError("Three arguments required (x and y offset of macros, output file name)")

    macro_hoffset = math.floor(float(sys.argv[1]) / site_width) * site_width
    macro_voffset = math.floor(float(sys.argv[2]) / site_height) * site_height
    print ("x offset legalized to {:>4.2f}".format(macro_hoffset))
    print ("y offset legalized to {:>4.2f}".format(macro_voffset))

    validate_hplace (macro_hoffset, get_clb_pdn_met4())

    with open(sys.argv[3], 'w') as f:
        for x, y in product(range(num_clb_x), range(num_clb_y)):
            f.write ("i_tile_x{}y{} {:>4.2f} {:>4.2f} R0\n"
                    .format(x + 1, y + 1,
                        macro_hoffset + x * top_vpitch * 5,
                        macro_voffset + y * 302))
