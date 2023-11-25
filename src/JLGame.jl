module JLGame

include("common.jl")

export QUIT
const QUIT = SDL_QUIT

export ColourRGBA
include("colour.jl")

export SCREEN_CENTER_X
export SCREEN_CENTER_Y
export RENDERER
export create_window
export quit
export splash
export update_display
include("display.jl")

export draw_filled_circle
include("draw.jl")

export Clock
export tick
include("clock.jl")

export events_exist
export pop_event
include("events.jl")

using .Colour
using .Display
using .Draw
using .Time
using .Events

export SDL_Event
export SDL_PollEvent
export SDL_QUIT
export SDL_SetRenderDrawColor
export SDL_RenderClear
export SDL_RenderPresent
export SDL_Delay

end

using .JLGame

window = create_window("JLGame", SCREEN_CENTER_X, SCREEN_CENTER_Y, 1000, 800)

function main()
    clock = Clock(60)
    RUNNING = true
    while RUNNING
        while events_exist()
            event = pop_event()
            if event.type == QUIT
                RUNNING = false
                break
            end
        end

        splash(96, 128, 255)
        
        draw_filled_circle(window, 300, 300, 50, ColourRGBA(255, 0, 0))
        draw_filled_circle(window, 420, 300, 50, ColourRGBA(255, 0, 0, 100))
        draw_filled_circle(window, 540, 300, 50, (0, 255, 0))
        draw_filled_circle(window, 660, 300, 50, (0, 255, 0, 100))

        update_display(window)

        tick(clock)
    end

    quit(window)
end

main()
