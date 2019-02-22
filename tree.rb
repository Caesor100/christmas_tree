def christmas_tree(floor, path)
  tree = ""
  tree += " "*(floor*2+(floor%2))+"W"+"\n"
  for i in 0..floor
    if i%2 == 0 and i > 0
      tree += " "*((floor-i)*2+(floor%2)-(i%2))+"@"*(i%2)+"*"*(i*4+1)+"@"+"\n"
    else
      tree += " "*((floor-i)*2+(floor%2)-(i%2))+"@"*(i%2)+"*"*(i*4+1)+"\n"
    end
  end
  if floor != 0
    if floor % 2 == 0
      tree += " "*(floor*1.5).to_i+"T"*(floor+1)+"\n"
      tree += " "*(floor*1.5).to_i+"T"*(floor+1)
    else
      tree += " "*(floor*1.5+2).to_i+"T"*floor+"\n"
      tree += " "*(floor*1.5+2).to_i+"T"*floor
    end
  else
    tree += "T"
  end

  File.open(path + "elka.txt", "w") do |file|
    file.write(tree)
  end

end

puts "Введите количество \"этажей\" елки: "
floor = gets.to_i
puts("Укажите путь к выходному файлу: ")
path = gets.chomp().strip()

if path[-1] != '/' and path.length > 0
    path += '/'
end

christmas_tree(floor, path)