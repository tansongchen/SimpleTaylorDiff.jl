using ChainRules
using ChainRulesCore

function define_unary_function(func, m)
    F = typeof(func)
    # base case
    @eval m function (op::$F)(t::TaylorScalar{T, 2}) where {T}
        t0, t1 = value(t)
        f0, f1 = @inline frule((NoTangent(), t1), op, t0)
        TaylorScalar{T, 2}(f0, zero_tangent(f0) + f1)
    end
    # recursion by raising
    @eval m function (op::$F)(t::TaylorScalar{T, N}) where {T, N}
        z = TaylorScalar{T, N - 1}(t)
        f0 = op(value(t)[1])
        _, df1 = @inline frule((NoTangent(), true), op, z)
        df = zero_tangent(z) + df1
        raise(f0, df, t)
    end
end
