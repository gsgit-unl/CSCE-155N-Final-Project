How to use the code:

1. Plot title, x label, and y label can be any set of characters.
2. x lim & y lim should have two separated numbers (otherwise there will be an error message in the command window and
will allow the user to reset the plot). They can be entered as [n1 n2], [n1,n2], n1 n2, and n1,n2. They do not allow negative
numbers for the limits if there are no negative numbers on that axis and max out at the extrema.
3. Type and color are both selected from menus. Type includes circles, xs, stars, a solid line, and a dashed line (o, x, *, 
-, --). Color includes red, magenta, yellow, green, cyan, blue, and black (r, m, y, g, c, b, k).
4. x values & y values should have the same amount of numbers (otherwise there will be an error message and a blank plot with
the reset button available or a plot with multiple data points for one value). They can be entered as n1 n2 n3, [n1 n2 n3],
[n1,n2,n3], and n1,n2,n3.

Sample data:

plot title: "Sample Data Plot 1!"
x values: 3 4 5 6 8
y values: [1,10,5,2,7]
x label: An x label
y label: A y label
x lim: [3,9]
y lim: 0 10
type: --
color: c
