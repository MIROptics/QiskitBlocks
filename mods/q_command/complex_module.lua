function create_complex()

    local complex = {}  -- the module

    -- creates a new complex number
    local function new (r, i)
        return {r=r, i=i}
    end

    complex.new = new        -- add 'new' to the module

    -- constant 'i'
    complex.i = new(0, 1)

    function complex.add (c1, c2)
        return new(c1.r + c2.r, c1.i + c2.i)
    end

    function complex.sub (c1, c2)
        return new(c1.r - c2.r, c1.i - c2.i)
    end

    function complex.mul (c1, c2)
        return new(c1.r*c2.r - c1.i*c2.i, c1.r*c2.i + c1.i*c2.r)
    end

    local function inv (c)
        local n = c.r^2 + c.i^2
        return new(c.r/n, -c.i/n)
    end

    function complex.div (c1, c2)
        return complex.mul(c1, inv(c2))
    end

    function complex.nearly_equals (c1, c2)
        return math.abs(c1.r - c2.r) < 0.001 and
                math.abs(c1.i - c2.i) < 0.001
    end

    function complex.abs (c)
        return math.sqrt(c.r^2 + c.i^2)
    end

    function complex.tostring (c)
        return string.format("(%g,%g)", c.r, c.i)
    end

    function complex.polar_radians(c)
        return math.atan2( c.i, c.r )
    end

    return complex

end