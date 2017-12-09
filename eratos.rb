# frozen_string_literal: true

require 'benchmark'

# Eratos Class
class Eratos
  MINIMUM_PRIME = 2

  # 与えられた整数以下の素数を返却する
  #
  # @param [String] num 整数
  # @return [Array] num 以下の素数
  #
  def self.prime_numbers_from(num)
    return "#{MINIMUM_PRIME} 以上の整数を入力してください。" unless valid?(num)

    consecutives = [*MINIMUM_PRIME..num.to_i]
    primes = []

    while Math.sqrt(num.to_i) > consecutives.first
      primes.push consecutives.first
      multiples = multiples_of(consecutives.first, consecutives.last)
      consecutives -= multiples
    end

    primes + consecutives
  end

  # バリデーション
  #
  # @param [String] num 整数
  # @return [Boolean] バリデーション結果
  #
  def self.valid?(num)
    num =~ /^[0-9]+$/ && num.to_i >= MINIMUM_PRIME
  end

  # 整数の倍数
  #
  # @param [Integer] num 対象の整数
  # @return [Integer] last_number 倍数の上限値
  #
  def self.multiples_of(num, last_number)
    multiples = []
    count = last_number.div(num)
    count.times { |i| multiples.push((i + 1) * num) }
    multiples
  end

  private_class_method :valid?, :multiples_of
end

p Eratos.prime_numbers_from(ARGV[0])
