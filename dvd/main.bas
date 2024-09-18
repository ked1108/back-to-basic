#include "raylib.bi"
#include "raymath.bi"

#define SCREEN_FACTOR 80
#define SCREEN_WIDTH 16 * SCREEN_FACTOR
#define SCREEN_HEIGHT 9 * SCREEN_FACTOR

dim velocity as Vector2 = type<Vector2>(5.0, 5.0)
dim logo as Rectangle = type<Rectangle>(GetScreenWidth()*0.5, GetScreenHeight()*0.5, 100.0, 120.0)
InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "DVD")
	while (WindowShouldClose = 0)
		logo.x += velocity.x * GetFrameTime()*50
		logo.y += velocity.y * GetFrameTime()*50

		if (logo.x+logo.width > GetScreenWidth() or logo.x < 0) then
			velocity.x *= -1
		end if

		if (logo.y+logo.height > GetScreenHeight() or logo.y < 0) then
			velocity.y *= -1
		end if

		BeginDrawing()
			ClearBackground(RAYWHITE)
			DrawRectangleRec(logo, RED)
		EndDrawing()
	wend
CloseWindow()
