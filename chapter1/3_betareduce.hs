-- Evaluate (that is, beta reduce) each of the following expressions to normal form.
-- 1. (lambda abc.cba)zz(lambda wv.w)
--    (lambda a. lambda b. lambda c.cba)zz(lambda w. lambda v.w)
--    (lambda c.czz)(lambda w.lamda v.w)
--    (lambda w.lamda v.w)zz
--    z

-- 2. (lambda x.lambda y.xyy)(lambda a.a)b
--    (lambda y.(lambda a.a)yy)b
--    (lambda y.yy)b
--    bb

-- 3. (lambda y.y)(lambda x.xx)(lambda z.zq)
--    (lambda x.xx)(lambda z.zq)
--    (lambda z.zq)(lambda z.zq)
--    (lambda z.zq)q
--    qq

-- 4. (lambda z.z)(lambda z.zz)(lambda z.zy)
--    (lambda a.a)(lambda b.bb)(lambda z.zy)
--    (lambda b.bb)(lambda z.zy)
--    (lambda z.zy)(lambda z.zy)
--    (lambda z.zy)y
--    yy

-- 5. (lambda x.lambda a.xaa)(lambda z.z)y
--    (lambda a.(lambda z.z)aa)y
--    (lambda z.z)yy
--    yy

-- 6. (lambda a.aa)(lambda b.bd)c
--    (lambda b.bd)(lambda b.bd)c
--    (lambda b.bd)dc
--    ddc
--    acc [since we have changed a to d in the first step]

-- 7. (lambda xyz.xz(yz))(lambda x.z)(lambda x.a)
--    (lambda x.lambda y.lambda z.xz (is) )(lambda x.z)(lambda x.a)
--    (lambda y.lambda z.iz)s(lambda x.z)(lambda x.a)
--    (lambda z.iz)(lambda (x.z))(lambda x.a)
--    i(lambda x.z)(lambda x.a)
--    iz