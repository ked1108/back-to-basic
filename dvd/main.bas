#include "raylib.bi"
#include "raymath.bi"

#define SCREEN_FACTOR 80
#define SCREEN_WIDTH 16 * SCREEN_FACTOR
#define SCREEN_HEIGHT 9 * SCREEN_FACTOR

dim velocity as Vector2 = type<Vector2>(5.0, 5.0)
dim logo as Texture2D = LoadTexture("logo.png")
dim position as Vector2 = type<Vector2>(GetScreenWidth()*0.5, GetScreenHeight()*0.5)
InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "DVD")
	while (WindowShouldClose = 0)
		position.x += velocity.x 
		position.y += velocity.y
		ClearBackground(RAYWHITE)
		BeginDrawing()
			DrawTextureV(logo, position, WHITE)
		EndDrawing()
	wend
CloseWindow()
