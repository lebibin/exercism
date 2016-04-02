class Prime

  def nth index
    raise ArgumentError if index.zero?

    prime_numbers = []

    # http://stackoverflow.com/a/736313
    fixnum_max = (2**(0.size * 8 -2) -1)

    for i in 2..fixnum_max do
      prime_numbers << i if miller_rabin_prime?(i, 10)
      break if index == prime_numbers.length
    end

    prime_numbers[index-1]
  end

  # Primality checking is hard! -- (╯°□°）╯︵ ┻━┻)
  # Use algorithm created by a Turing award recipient, Michael Oser Rabin
  # Miller-Rabin primality test function
  # https://rosettacode.org/wiki/Miller%E2%80%93Rabin_primality_test#Ruby

  def mod_exp(n, e, mod)
    fail ArgumentError, 'negative exponent' if e < 0
    prod = 1
    base = n % mod
    until e.zero?
      prod = (prod * base) % mod if e.odd?
      e >>= 1
      base = (base * base) % mod
    end
    prod
  end

  def miller_rabin_prime?(n, g)
    return true if n == 2 # special case, since 2 is the only even prime num
    d = n - 1
    s = 0
    while d % 2 == 0
      d /= 2
      s += 1
    end
    g.times do
      a = 2 + rand(n - 4)
      x = mod_exp(a, d, n) # x = (a**d) % n
      next if x == 1 || x == n - 1
      for r in (1..s - 1)
        x = mod_exp(x, 2, n) # x = (x**2) % n
        return false if x == 1
        break if x == n - 1
      end
      return false if x != n - 1
    end
    true # probably
  end
end
