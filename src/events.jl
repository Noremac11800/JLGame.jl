module Events

include("common.jl")

export events_exist
export pop_event
export is_key_pressed
export QUIT
export K_ESCAPE
export K_SPACE
export K_ENTER
export K_RETURN
export K_A
export K_B
export K_C
export K_D
export K_E
export K_F
export K_G
export K_H
export K_I
export K_J
export K_K
export K_L 
export K_N
export K_O
export K_P
export K_Q
export K_R
export K_S
export K_T
export K_U
export K_V
export K_W
export K_X
export K_Y
export K_Z

const QUIT = SDL_QUIT

EVENTS_REF = Ref{SDL_Event}()

K_SPACE = SDL_SCANCODE_SPACE
K_ENTER = SDL_SCANCODE_RETURN
K_RETURN = SDL_SCANCODE_RETURN
K_ESCAPE = SDL_SCANCODE_ESCAPE

K_A = SDL_SCANCODE_A
K_B = SDL_SCANCODE_B
K_C = SDL_SCANCODE_C
K_D = SDL_SCANCODE_D
K_E = SDL_SCANCODE_E
K_F = SDL_SCANCODE_F
K_G = SDL_SCANCODE_G
K_H = SDL_SCANCODE_H
K_I = SDL_SCANCODE_I
K_J = SDL_SCANCODE_J
K_K = SDL_SCANCODE_K
K_L = SDL_SCANCODE_L
K_M = SDL_SCANCODE_M
K_N = SDL_SCANCODE_N
K_O = SDL_SCANCODE_O
K_P = SDL_SCANCODE_P
K_Q = SDL_SCANCODE_Q
K_R = SDL_SCANCODE_R
K_S = SDL_SCANCODE_S
K_T = SDL_SCANCODE_T
K_U = SDL_SCANCODE_U
K_V = SDL_SCANCODE_V
K_W = SDL_SCANCODE_W
K_X = SDL_SCANCODE_X
K_Y = SDL_SCANCODE_Y
K_Z = SDL_SCANCODE_Z

function is_key_pressed(event::SDL_Event, key::SDL_Scancode)::Bool
    if event.type == SDL_KEYDOWN
        return event.key.keysym.scancode == key
    end
    return false
end

function update_key_states()
    SDL_PumpEvents()
end

function events_exist()::Bool
    update_key_states()
    return Bool(SDL_PollEvent(EVENTS_REF))
end

function pop_event()::SDL_Event
    return EVENTS_REF[]
end

end
