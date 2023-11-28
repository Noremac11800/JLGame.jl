using Pkg; Pkg.activate(".")
using JLGame

window = create_window("JLGame", 800, 600)

function main()
    x, y = 400, 300
    speed = 3
    clock = Clock(60)
    RUNNING = true
    while RUNNING
        while events_exist()
            event = pop_event()
            if event.type == QUIT || is_key_pressed(event, K_ESCAPE)
                RUNNING = false
                break
            end

            if is_key_pressed(event, K_W)
                y -= speed
            end
            if is_key_pressed(event, K_A)
                x -= speed
            end
            if is_key_pressed(event, K_S)
                y += speed
            end
            if is_key_pressed(event, K_D)
                x += speed
            end
        end

        splash(window, BLACK)

        draw_filled_rect(window, x, y, 30, 30, LIGHTGREY)

        update_display(window)

        tick(clock)
    end

    quit(window)
end

main()