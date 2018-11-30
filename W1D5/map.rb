class Map
    def initialize
        @underlying_arr = []
    end

    def set(key, value)
        if @underlying_arr.any? { |sub_arr| sub_arr[0] == key }
            @underlying_arr.each do |sub_arr| 
                if sub_arr[0] == key 
                    sub_arr[-1] = value
                end
            end
            
        else
            @underlying_arr << [key, value]
        end
    end

    def get(key)
        @underlying_arr.each do |sub_arr|
            return sub_arr[1] if sub_arr[0] == key
        end
    end

    def delete(key)
        @underlying_arr.each do |sub_arr|
            key.delete(sub_arr) if sub_arr[0] == key
        end
    end

    def show
        puts "{"
        @underlying_arr.each do |sub_arr|
            puts "#{sub_arr[0]} => #{sub_arr[1]}"
        end
        puts "}"
    end
end