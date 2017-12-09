# frozen_string_literal: true

require_relative '../eratos'

describe Eratos do
  describe '.prime_numbers_from(num)' do
    context 'num が整数以外の場合' do
      it 'エラーメッセージを返却すること' do
        message = '2 以上の整数を入力してください。'
        expect(Eratos.prime_numbers_from('a')).to eq message
        expect(Eratos.prime_numbers_from(2.1)).to eq message
        expect(Eratos.prime_numbers_from(0)).to eq message
        expect(Eratos.prime_numbers_from(-0.1)).to eq message
        expect(Eratos.prime_numbers_from(-1)).to eq message
      end
    end

    context 'num が 2 未満の整数の場合' do
      it 'エラーメッセージを返却すること' do
        message = '2 以上の整数を入力してください。'
        expect(Eratos.prime_numbers_from(1)).to eq message
        expect(Eratos.prime_numbers_from(0)).to eq message
        expect(Eratos.prime_numbers_from(-1)).to eq message
      end
    end

    context 'num が 2 以上の整数の場合' do
      it 'num までの素数を返却すること' do
        expect(Eratos.prime_numbers_from(2)).to eq [2]
        expect(Eratos.prime_numbers_from(3)).to eq [2, 3]
        expect(Eratos.prime_numbers_from(4)).to eq [2, 3]
        expect(Eratos.prime_numbers_from(5)).to eq [2, 3, 5]
        expect(Eratos.prime_numbers_from(6)).to eq [2, 3, 5]
        expect(Eratos.prime_numbers_from(120)).to eq [2, 3, 5, 7, 11,
                                                      13, 17, 19, 23,
                                                      29, 31, 37, 41,
                                                      43, 47, 53, 59,
                                                      61, 67, 71, 73,
                                                      79, 83, 89, 97,
                                                      101, 103, 107, 109, 113]
      end
    end
  end
end
