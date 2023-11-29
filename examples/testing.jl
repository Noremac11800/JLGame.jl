using Pkg; Pkg.activate(".")
using JLGame

window = create_window("JLGame", 800, 600)

function main()
    font = get_font("sunnyspells", 50)
    surf = render_font(font, "This is some text", BLACK)

    x = 400
    speed = 2
    clock = Clock(120)
    RUNNING = true
    while RUNNING

        while events_exist()
            event = pop_event()
            if event.type == QUIT
                RUNNING = false
                break
            end
        end

        x += speed
        if x < 200
            x = 200
            speed *= -1
        end
        if x > 400
            x = 400
            speed *= -1
        end

        splash(window, WHITE)
        
        blit(window, surf, x, 300)

        update_display(window)

        tick(clock)
    end

    quit(window)
end

main()
