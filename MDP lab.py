def get_state_utilities(epsilon, rewards, gamma=0.999):
    R = {s+1: float(rewards[s]) for s in range(6)}
    terminal = 3
    to_rc = {s: ((s-1)//3, (s-1)%3) for s in range(1,7)}
    to_s  = {rc: s for s, rc in to_rc.items()}

    A = ['N','E','S','W','Stay']
    dvec = {'N':(-1,0),'E':(0,1),'S':(1,0),'W':(0,-1),'Stay':(0,0)}

    def step(s, a):
        if s == terminal: 
            return terminal
        r,c = to_rc[s]
        dr,dc = dvec[a]
        nr, nc = r+dr, c+dc
        if not (0 <= nr < 2 and 0 <= nc < 3):
            return s
        return to_s[(nr,nc)]

    def trans(s, a):
        if s == terminal:
            return {terminal: 1.0}
        if a == 'Stay':
            return {s: 1.0}
        if a in ('N','S'):
            slips = ('E','W')
        else:
            slips = ('N','S')
        parts = [(a,0.9), (slips[0],0.05), (slips[1],0.05)]
        d = {}
        for aa, p in parts:
            ns = step(s, aa)
            d[ns] = d.get(ns, 0.0) + p
        return d

    U = {s: 0.0 for s in range(1,7)}
    while True:
        U_new = {}
        maxdiff = 0.0
        for s in range(1,7):
            best = float('-inf')
            for a in A:
                e = sum(p * U[s2] for s2, p in trans(s, a).items())
                if e > best:
                    best = e
            U_new[s] = R[s] + gamma * best
            maxdiff = max(maxdiff, abs(U_new[s] - U[s]))
        U = U_new
        if maxdiff < float(epsilon):
            break
    return [U[s] for s in range(1,7)]
