def sluggish_octopus(array)
    sorted = false
    until sorted
        sorted = true
        array.each_index do |i|
            if i < array.length - 1 && array[i].length > array[i+1].length
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
    
        end
    end
    array
end

array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p sluggish_octopus(array)

def dominant_octo(array)
    return array if array.length == 1

    middle = array.length / 2
    left = dominant_octo(array.take(middle))
    right = dominant_octo(array.drop(middle))
    merge(left, right)
end

def merge(left, right)
    merged = []

    until left.empty? || right.empty?
        compared = left.first.length <=> right.first.length
        case compared
        when -1
            merged << left.shift
        when 0
            merged << left.shift
        when 1
            merged << right.shift
        end
    end
        
    merged + left + right
end

# p dominant_octo(array)

def clever_octo(array)
    longest = array[0]

    array.each_index do |i|
        next if i == 0
        longest = array[i] if array[i].length > longest.length
    end 
    longest
end

# p clever_octo(array)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance_octo(array, direction)
    array.each_index { |i| return i if array[i] == direction }
end 

def constant_dance_octo(array, direction)
    hash = {}
    array.each_index { |i| hash[array[i]] = i }
    hash[direction]
end

# p slow_dance_octo(tiles_array, "right-down")
p constant_dance_octo(tiles_array, "right-down")