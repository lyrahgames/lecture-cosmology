set size 1.6,0.9
set object 1 rect from graph 0,graph 0 to graph 1,graph 1 fc rgb "#f6f6f6" fs solid 1.0 noborder behind
set grid lt 1 lw 3 lc rgb "#fafafa"
f(a,x) = -0.5 * a**3 * x**2 - 1/x

set key left spacing 2 box opaque

set xl "$r/r_0$"
set yl "$v^{2}$"
# set format x "$%.1f r_0$"
set xtics 1

set samples 1000

set label at graph 0.4,0.3 "$\\displaystyle U_k(r)\\define v^2\\roundBrackets{\\mp\\frac{k^3}{2}\\frac{r^2}{r^2_0} - \\frac{r_0}{r}}$" front

set arrow nohead from 1,graph 0 to 1, f(1,1) lt 1 lw 2 lc black dt 3
set label "$r_\\mathrm{krit}^{(1)}$" at 0.89,graph 0.1 rotate left front
set arrow nohead from 1/0.8,graph 0 to 1/0.8, f(0.8,1/0.8) lt 1 lw 2 lc black dt 3
set label "$r_\\mathrm{krit}^{(0.8)}$" at 1/0.8 + 0.11,graph 0.1 rotate left front

plot [-0.1:5] 0*x with l lt 1 lw 2 dt 2 lc black title "",\
  [0.05:5] f(0.8,x) with l lt 1 lw 3 lc rgb "#ff5500" title "$U_{0.8}$",\
  [0.05:5] f(-0.8,x) with l lt 1 lw 3 lc rgb "#ff5500" title "",\
  [0.05:5] f(1,x) with l lt 1 lw 3 lc rgb "#0055ff" title "$U_1$",\
  [0.05:5] f(-1,x) with l lt 1 lw 3 lc rgb "#0055ff" title "",\
  [0.05:5] f(0,x) with l lt 1 lw 3 lc black title '$U_0$',\
  [1/0.8:1/0.8] f(0.8,x) with p pt 13 lc black title '',\
  [1:1] f(1,x) with p pt 13 lc black title ''