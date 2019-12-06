def confirmDimensions(matrices)
    initMatrix = matrices[0]
    for matrix in matrices
        return false if matrix.length != initMatrix.length
        for arr in matrix
            return false if arr.length != initMatrix[0].length
        end 
    end
    return true
end 

def matrix_addition_reloaded(*matrices)
    return nil if(!confirmDimensions(matrices))

    result = []
    for row in matrices[0]
        result << row.clone()
    end 

    for matrix in matrices
        next if(matrix == result) 
        for i in (0..matrix.length-1)
            for j in (0..matrix[i].length-1)
                result[i][j] = result[i][j] + matrix[i][j] 
            end 
        end 
    end 
    result
end

def squarocol?(arr)
    for row in arr 
        return true if row.all? {|ele| ele == row[0]}
    end 

    for column_i in (0..arr[0].length-1)
        ch = arr[0][column_i]
        t_arr = []
        for row in arr
            t_arr << row[column_i]
        end 
        return true if t_arr.all? {|ele| ele == ch}
    end 

    return false
    
end 

def squaragonal?(arr)
    # index_x
    # index_y
    result = []
    for index_x in (0..arr.length - 1)
        for index_y in (0..arr[index_x].length - 1)
            result << arr[index_x][index_y] if (index_x == index_y)
        end 
    end 
    return true if result.all? {|x| x == arr[0][0]}
    
    #3,0    2,1     1,2     0,3
    result = []
    for index_x in (0..arr.length - 1)
        for index_y in (0..arr[index_x].length - 1)
            result << arr[index_x][index_y] if (index_x + index_y == arr.length - 1)
        end 
    end 
    return true if result.all? {|x| x == arr[arr.length-1][0]}
    return false
end 


def pascals_triangle(n)
    return [[1]] if n == 1
    return [[1],[1,1]] if n == 2
    
    row, col, default_value = n, n, 0
    result = Array.new(row){Array.new(col,default_value)}
    #default first two lines
    result[0][0] = 1
    result[1][0] = 1
    result[1][1] = 1
    for i in (2..n-1)
        for j in (0..n-1)
            if j == 0
                result[i][j] = 1
                next
            end 
            #construct new row according to this rule
            result[i][j] = result[i-1][j] + result[i-1][j-1]
        end
    end
    #rid of excess 0's
    for row in result
        row.reject! {|e| e == 0}
    end
    return result
end

p pascals_triangle(7)

#     [1, 0, 0, 0, 0, 0],
#     [1, 1, 0, 0, 0, 0],
#     [1, 2, 1, 0, 0, 0],
#     [1, 3, 3, 1, 0, 0],
#     [1, 4, 6, 4, 1, 0],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]

# arr[i][j] = arr[i-1][j] + arr[i-1][j-1]
# arr[4][2] = arr[3][2] + arr[3][1]

#     [1, 0, 0, 0, 0, 0],
#     [1, 1, 0, 0, 0, 0],
#     [1, 2, 1, 0, 0, 0],
#     [1, 3, 3, 1, 0, 0],
#     [1, 4, 6, 4, 1, 0],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]

# arr[i][j] = arr[i-1][j] + arr[i-1][j-1]
