
@testset "Unary functions" begin
    @test derivative(exp, 1., 10) ≈ exp(1.)
    @test derivative(expm1, 1., 10) ≈ exp(1.)
    @test derivative(log, 10., 1) ≈ .1
    @test derivative(log, 10., 2) ≈ -.01
    @test derivative(log, 10., 3) ≈ .002
    @test derivative(log1p, 9., 1) ≈ .1
    @test derivative(log1p, 9., 2) ≈ -.01
    @test derivative(log1p, 9., 3) ≈ .002
    @test derivative(sin, 1., 1) ≈ cos(1.)
    @test derivative(sin, 1., 2) ≈ -sin(1.)
    @test derivative(sin, 1., 3) ≈ -cos(1.)
    @test derivative(sin, 1., 4) ≈ sin(1.)
    @test derivative(cos, 1., 1) ≈ -sin(1.)
    @test derivative(cos, 1., 2) ≈ -cos(1.)
    @test derivative(cos, 1., 3) ≈ sin(1.)
    @test derivative(cos, 1., 4) ≈ cos(1.)
    @test derivative(asin, .5, 1) ≈ 2 / √3
    @test derivative(acos, .5, 1) ≈ -2 / √3
    @test derivative(atan, 1., 1) ≈ .5
end

@testset "Binary functions" begin
    @test derivative(x -> x^3, 3., 2) ≈ 18.
end
