using Decimals
using Compat.Test

@testset "Rounding" begin

@test round(Decimal(7.123456), 0) == Decimal(7)
@test round(Decimal(7.123456), 2) == Decimal(7.12)
@test round(Decimal(7.123456), 3) == Decimal(7.123)
@test round(Decimal(7.123456), 5) == Decimal(7.12346)
@test round(Decimal(7.123456), 6) == Decimal(7.123456)

@test round(0.123, 1) == 0.1
@test round.([0.1111 0.2222 0.8888], 2) == [0.11 0.22 0.89]

function tet()
    a = parse(Decimal, "1.0000001")
    for i = 1:27
        a *= a
    end
    return a
end

# set DIGITS = 20 (aaljuffali's example)
@test tet() == Decimal(0, 67453047074102193157641340, -20)

end
