module JLGame

using SimpleDirectMediaLayer
using SimpleDirectMediaLayer.LibSDL2

export SCREEN_CENTER_X
export SCREEN_CENTER_Y
export RENDERER
export create_window
export quit

include("display.jl")

export draw_filled_circle
include("draw.jl")

using .Display
using .Draw

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
    close = false
    while !close
        event_ref = Ref{SDL_Event}()
        while Bool(SDL_PollEvent(event_ref))
            evt = event_ref[]
            evt_ty = evt.type
            if evt_ty == SDL_QUIT
                close = true
                break
            end
        end

        SDL_SetRenderDrawColor(RENDERER, 96, 128, 255, 255);
        SDL_RenderClear(RENDERER);

        SDL_SetRenderDrawColor(RENDERER, 255, 0, 0, 255);
        draw_filled_circle(RENDERER, 300, 300, 50)

        SDL_RenderPresent(RENDERER)

        SDL_Delay(1000 ÷ 60)
    end

    quit(window)
end

main()
