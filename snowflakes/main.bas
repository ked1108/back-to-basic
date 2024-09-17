#include "raylib.bi"
#include "raymath.bi"

#define SCREEN_FACTOR 90
#define SCREEN_WIDTH (16 * SCREEN_FACTOR)
#define SCREEN_HEIGHT (9 * SCREEN_FACTOR)

#define BRANCH_COUNT 5
#define BRANCH_ANGLE (2*PI / BRANCH_COUNT)
#define BRANCH_LEN SCREEN_FACTOR * 1.5

#define HUE 230

sub drawSnowFlake(byval center as Vector2, byval sat as single, byval length as single, byval thick as single, byval level as single)
	if (level <= 0) then
		return
	end if
	dim col as Color = ColorFromHSV(type<Vector3>(HUE, sat, 1.0))
	for i as integer = 0 to BRANCH_COUNT -1
		DrawLineEx(center, type(center.x + cos(BRANCH_ANGLE*i) * length, center.y + sin(BRANCH_ANGLE * i) * length), thick, col)
		drawSnowFlake(type(center.x + cos(BRANCH_ANGLE*i) * length, center.y + sin(BRANCH_ANGLE * i) * length), sat-0.1, length*0.5, thick * 0.5, level-1)
	next i
end sub

InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Snowflake")
	while (WindowShouldClose() = 0)
		BeginDrawing()
			drawSnowFlake(type<Vector2>(GetScreenWidth()*0.5, GetScreenHeight()*0.5), 0.8, BRANCH_LEN, 10.0, 5)
		EndDrawing()
	wend
CloseWindow()
