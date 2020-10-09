pure functions are deterministic and don't have any stored state.
they also don't produce any side effects (such as writing to vars,
streams ans files)

skoro my_strlen jest pure, i s się nie zmienia to kompilator
policzy my_strlen raz i zapamiętamy wartość