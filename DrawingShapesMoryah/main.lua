-----------------------------------------------------------------------------------------
-- Title: DrawingShapes
-- Name: Moryah
-- Course: ICS2O
-- This program displays shapes and shows their names
-----------------------------------------------------------------------------------------

-- Your code here

-- set backgroung colour
display.setDefault("background", 222/255, 222/255, 222/255)

-- remove status background
display.setStatusBar(display.HiddenStatusBar)

-- create local variables
local pentagon
local trapazoid
local concave
local rombis
local octogon
local hexagram
local cross
local hexagon
local tripod

-- create pentagon
pentagon = display.newPolygon (256,192, {0,-60, 60,0, 40,80, -40,80, -60,0})

-- set the width of the border
pentagon.strokeWidth = 5

-- set the colour of pentagon
pentagon:setFillColor(0/255, 250/255, 200/255)

-- colour border
pentagon:setStrokeColor(0)

-- write pentagonText
pentagonText = display.newText("pentagon", 255, 300, nil, 40)

-- set text colour
pentagonText:setTextColor(0/255, 250/255, 200/255)
-----------------------------------------------------------------------------

-- create trapazoid
trapazoid = display.newPolygon (768,192, {-60,-60, 60,-60, 40,60, -40,60})

-- set the width of the border
trapazoid.strokeWidth = 5

-- set the colour of trapazoid
trapazoid:setFillColor(123/255, 145/255, 178/255)

-- colour border
trapazoid:setStrokeColor(0)

-- write trapazoidText
trapazoidText = display.newText("trapazoid", 765, 300, nil, 40)

-- set text colour
trapazoidText:setTextColor(123/255, 145/255, 178/255)
-----------------------------------------------------------------------------

-- create concave hexagon
concave = display.newPolygon (512,384, {-55,-60, 0,-20, 55,-60, 55,40, 0,80,
 -55,40})

-- set the width of the border
concave.strokeWidth = 5

-- set the colour of concave hexagon
concave:setFillColor(255/255, 255/255, 155/255)

-- colour border
concave:setStrokeColor(0)

-- write concaveText
concaveText = display.newText("concave hexagon", 512, 490, nil, 40)

-- set text colour
concaveText:setTextColor(255/255, 255/255, 155/255)
-----------------------------------------------------------------------------

-- create rombis
rombis = display.newPolygon (255,576, {-60,-60, 60,-60, 40,60, -80,60})

-- set the width of the border
rombis.strokeWidth = 5

-- set the colour of rombis
rombis:setFillColor(120/255, 120/255, 255/255)

-- colour border
rombis:setStrokeColor(0)

-- write concaveText
rombisText = display.newText("rombis", 256, 660, nil, 40)

-- set text colour
rombisText:setTextColor(120/255, 120/255, 255/255)
-----------------------------------------------------------------------------

-- create octagon
octagon = display.newPolygon (768,576, {-20,-60, 20,-60, 60,-20, 60,20, 20,60,
 -20,60, -60,20, -60,-20})

-- set the width of the border
octagon.strokeWidth = 5

-- set the colour of octagon
octagon:setFillColor(111/255, 255/255, 111/255)

-- colour border
octagon:setStrokeColor(0)

-- write concaveText
octagonText = display.newText("octagon", 775, 660, nil, 40)

-- set text colour
octagonText:setTextColor(111/255, 255/255, 111/255)
-----------------------------------------------------------------------------

-- create hexagram
hexagram = display.newPolygon (768,400, {-60,-40, -10,-40, 0,-60, 10,-40, 60,
-40, 30,10, 60,60, 10,60, 0,80, -10,60, -60,60, -30,10})

-- set the width of the border
hexagram.strokeWidth = 5

-- set the colour of hexagram
hexagram:setFillColor(255/255, 100/255, 255/255)

-- colour border
hexagram:setStrokeColor(0)


-- write hexagramText
hexagramText = display.newText("hexagram", 775, 490, nil, 40)

-- set text colour
hexagramText:setTextColor(255/255, 100/255, 255/255)
-----------------------------------------------------------------------------

-- create cross
cross = display.newPolygon (256,400, {-20,-60, 20,-60, 20,-20, 60,-20, 60,20,
 20,20, 20,60, -20,60, -20,20, -60,20, -60,-20, -20,-20})

-- set the width of the border
cross.strokeWidth = 5

-- set the colour of cross
cross:setFillColor(177/255, 33/255, 154/255)

-- colour border
cross:setStrokeColor(0)

-- write crossText
crossText = display.newText("cross", 255, 490, nil, 40)

-- set text colour
crossText:setTextColor(177/255, 33/255, 154/255)
-----------------------------------------------------------------------------

-- create hexagon
hexagon = display.newPolygon (512,192, {-20,-40, 20,-40, 60,0, 20,40, -20,40,
 -60,0,})

-- set the width of the border
hexagon.strokeWidth = 5

-- set the colour of hexagon
hexagon:setFillColor(255/255, 211/255, 211/255)

-- colour border
hexagon:setStrokeColor(0)

-- write hexagonText
hexagonText = display.newText("hexagon", 512, 300, nil, 40)

-- set text colour
hexagonText:setTextColor(255/255, 111/255, 111/255)
-----------------------------------------------------------------------------

-- create tripod
tripod = display.newPolygon (512,576, {-20,-60, 0,-20, 20,-60, 40,-0,
10,0, 30,30, -30,30, -10,0, -40,0, })

-- set the width of the border
tripod.strokeWidth = 5

-- set the colour of tripod
tripod:setFillColor(255/255, 111/255, 111/255)

-- colour border
tripod:setStrokeColor(0)

-- write tripodText
tripodText = display.newText("tripod", 512, 660, nil, 40)

-- set text colour
tripodText:setTextColor(255/255, 100/255, 100/255)