using Pkg; Pkg.activate(".")
using JLGame

window = create_window("JLGame", 800, 600)

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

        splash(window, BLACK)

        draw_line(window, 20, 20, 400, 350, GREEN)

        update_display(window)

        tick(clock)
    end

    quit(window)
end

main()
