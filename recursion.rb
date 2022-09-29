def exp(base, num)

    return 1 if num == 0
    return base if num == 1

    base * exp(base, num -1)

end


def exp2(base, num)
    return 1 if num == 0
    return base if num == 1

    even_func = exp(base, num / 2) ** 2
    odd_func = base * (exp(base, (num -1) / 2) ** 2)

    if num.even?
        return even_func * even_func
    else
        return odd_func * odd_func
    end

end


# p exp2(1, 0)
# p exp2(1, 1)
# p exp2(1, 2)
# p exp2(2, 0)
# p exp2(2, 1)
# p exp2(2, 3)
# p exp2(2, 256)


class Array
    def deep_dup
        return [] if self.length == 0
        # return self if !self[0].is_a?

        new = []

        self.each do |ele|
            new << ele if !ele.is_a?  
            ele.deep_dup 
        end
        new
    end
end


# arr = [1,[2],[3, [4]]]
# p arr.object_id 

# p Array.new(arr).object_id

def fib_i(num)
    [1, 1].take(num) if num <= 2

    fib_arr = [1, 1]
    (2..num).each do |n|
        fib_arr << fib_arr[-2] + fib_arr[-1]
    end
    fib_arr
end

# p fib_i(0)
# p fib_i(1)
# p fib_i(2)
# p fib_i(10)
# p fib_i(5)
# p fib_i(8)

def fib_r(num)
    return [1, 1].take(num) if num <= 2
    fib1 = fib_r(num -1)
    fib1 << fib1[-1] + fib1[-2]
end

# p fib_r(0)
# p fib_r(1)
# p fib_r(2)
# p fib_r(20)
# p fib_r(5)
# p fib_r(8)

def bsearch(arr, target)
    return nil if !arr.include?(target)
    # return 0 if target == 1


    mid = arr.length / 2
    less = arr[0...mid]
    more = arr[mid..-1]

    index_count = mid

    if arr[mid] < target
        index_count += bsearch(more, target)
        
    elsif arr[mid] > target
        index_count = bsearch(less, target) 
    end

    index_count

end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 6, 7 , 8, 9, 10], 6) # => nil


def merge_s(arr)
    return arr if arr.empty?
    return arr if arr.all?(&:is_a?(Integer))

   
    mid = arr.size / 2
    left = arr[0...mid]
    right = arr[mid..-1]
    merge_s(left) + merg_s(right)

end


p merge_s([38,27,43,3,9,82,10])