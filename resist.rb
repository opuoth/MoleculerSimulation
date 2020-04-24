#####入力#####
$boxMaxX = 60
$boxMaxY = 80
$boxMaxZ = 50
$boxMin = 0
$molecularDist1 = 1.7
$trials = 10000
totalMono = 854
degreePoly = 10
###############

$check = []
$error = false
$cnt = 0
$index = [2, 3, 1, 4, 5, 6, 7]

class Molecule
  def initialize(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
    @omega = omega
    @fai = fai
    @ramuda = ramuda
    @CS = cs * Math.cos(@omega) - ss * Math.sin(@omega) * Math.cos(@fai)
    @SS = (1-@CS**2)**0.5
    defineCfSf(cs, ss, cf, sf)
    @x = x + @ramuda * @SS * @CF
    @y = y + @ramuda * @SS * @SF
    @z = z + @ramuda * @CS
    @vx = rand(-1.0..1.0) * 0.0001
    @vy = rand(-1.0..1.0) * 0.0001
    @vz = rand(-1.0..1.0) * 0.0001
  end

  def put
    puts "@x: #{@x}, @y: #{@y}, @z: #{@z}"
    puts "@vx: #{@vx}, @vy: #{@vy}, @vz: #{@vz}"
  end

  def info
    {x: @x, y: @y, z: @z, cs: @CS, ss: @SS, cf: @CF, sf: @SF, vx: @vx, vy: @vy, vz: @vz}
  end

  private

  def defineCfSf(cs, ss, cf, sf)
    if @SS == 0
      @SF = 0.0
      @CF = 1.0
    elsif ss == 0
      @SF = sf
      @CF = cf
    else
      @A = (Math.cos(@omega) - cs * @CS)/(ss * @SS)
      @B = Math.sin(@fai) * Math.sin(@omega)/@SS
      @SF = @A * sf + @B * cf
      @CF = @A * cf - @B * sf
    end
  end
end

class Molecule2 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = rand(0..1.0)
    g = rand(0..1.0)
    omega = Math::PI * f
    fai = 2 * Math::PI * g
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
end

class Molecule2Init
  def initialize
    @ramuda = 1.7
    ##オリジナル##
    theta = Math::PI * rand(0..1.0)
    fai = 2 * Math::PI * rand(0..1.0)
    @CS = Math.cos(theta)
    @SS = (1-@CS**2)**0.5
    @CF = Math.cos(fai)
    @SF = (1-@CF**2)**0.5
    ##############
    @x = $boxMaxX * rand(0..1.0)
    @y = $boxMaxY * rand(0..1.0)
    @z = $boxMaxZ * rand(0..1.0)
    @vx = rand(-1.0..1.0) * 0.0001
    @vy = rand(-1.0..1.0) * 0.0001
    @vz = rand(-1.0..1.0) * 0.0001
  end

  def info
    {x: @x, y: @y, z: @z, cs: @CS, ss: @SS, cf: @CF, sf: @SF, vx: @vx, vy: @vy, vz: @vz}
  end
end

class Molecule3 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = rand(0..1.0)
    g = rand(0..1.0)
    omega = Math::PI * f
    fai = 2 * Math::PI * g
    # ramuda = 1.549
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
end

class Molecule1 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = 0.39183333
    # g = 0.2
    loop do 
      $g = rand(0..1.0)
      break if $g <= 0.5 || $g >= 0.8
    end
    omega = Math::PI * f
    fai = 2 * Math::PI * $g
    # ramuda = 1.539
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
end

class Molecule4 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = 0.391833333
    g = 0.33408333 + $g
    omega = Math::PI * f
    fai = 2 * Math::PI * g
    # ramuda = 1.517
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
end

class Molecule5 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = 0.3022222
    g = 0.5
    omega = Math::PI * f
    fai = 2 * Math::PI * g
    # ramuda = 1.517
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
end

class Molecule6 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = 0.3811111
    g = 0
    omega = Math::PI * f
    fai = 2 * Math::PI * g
    # ramuda = 1.36
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
end

class Molecule7 < Molecule
  def initialize(x:, y:, z:, cs:, ss:, cf:, sf:, vx:, vy:, vz:)
    f = 0.35333333
    # g = 0.7
    g = rand(0..1.0)
    omega = Math::PI * f
    fai = 2 * Math::PI * g
    # ramuda = 1.446
    ramuda = 1.7
    super(x, y, z, cs, ss, cf, sf, omega, fai, ramuda, vx, vy, vz)
  end
# end

# class MonomarInit
#   def initialize(molecule2)
#     @molecule = {}
#     $trials.times do
#       @molecule[2] = molecule2
#       next unless check(2)
#       @molecule[3] = Molecule3.new(@molecule[2])
#       next unless check(3)
#       @molecule[1] = Molecule1.new(@molecule[3]).info
#       next unless check(1)
#       @molecule[4] = Molecule4.new(@molecule[1]).info
#       next unless check(4)
#       @molecule[5] = Molecule5.new(@molecule[4]).info
#       next unless check(5)
#       @molecule[6] = Molecule6.new(@molecule[5]).info
#       next unless check(6)
#       @molecule[7] = Molecule7.new(@molecule[6]).info
#       next unless check(7)
#     end
#   end

#   def info
#     @molecule
#   end

#   def check(k)
#     return false if @molecule[k][:x]>$boxMaxX || @molecule[k][:y]>$boxMaxY || @molecule[k][:z]>$boxMaxZ || @molecule[k][:x]<$boxMin || @molecule[k][:y]<$boxMin || @molecule[k][:z]<$boxMin
#     $check.each do |mono|
#       mono.each do |_, atom|
#         r = Math.sqrt((atom[:x] - @molecule[k][:x])**2 + (atom[:y] - @molecule[k][:y])**2 + (atom[:z] - @molecule[k][:z])**2)
#         return false if r < $molecularDist1
#       end
#     end
#     return true
#   end
# end

class Monomar
  def initialize(num, i, molecule3 = {})
    @num = num
    @i = i
    @molecule = {}
    $trials.times do |try|
      $error = true if try == $trials -1
      #繋がってるかどうか
      if molecule3.empty?
        @molecule[2] = Molecule2Init.new.info #繋がっていない
      else
        @molecule[2] = Molecule2.new(molecule3).info #繋がっている
      end
      next unless check(2)
      @molecule[3] = Molecule3.new(@molecule[2]).info
      next unless check(3)
      @molecule[1] = Molecule1.new(@molecule[3]).info
      next unless check(1)
      @molecule[4] = Molecule4.new(@molecule[1]).info
      next unless check(4)
      @molecule[5] = Molecule5.new(@molecule[4]).info
      next unless check(5)
      @molecule[6] = Molecule6.new(@molecule[5]).info
      next unless check(6)
      @molecule[7] = Molecule7.new(@molecule[6]).info
      next unless check(7)
      $error = false
      $check.push(@molecule)
      break
    end
  end

  def info
    @molecule
  end

  def molecule(n)
    @molecule[n]
  end

  def check(k)
    return false if @molecule[k][:x]>$boxMaxX || @molecule[k][:y]>$boxMaxY || @molecule[k][:z]>$boxMaxZ || @molecule[k][:x]<$boxMin || @molecule[k][:y]<$boxMin || @molecule[k][:z]<$boxMin
    $check.each do |mono|
      mono.each do |_, atom|
        r = Math.sqrt((atom[:x] - @molecule[k][:x])**2 + (atom[:y] - @molecule[k][:y])**2 + (atom[:z] - @molecule[k][:z])**2)
        return false if r < $molecularDist1
      end
    end
    return true
  end
end

class Poly
  def initialize(degreePoly, num)
    @poly = {}
    while true do
      degreePoly.times do |i|
        if i == 0
          @mono = Monomar.new(num, i)
        else
          @mono = Monomar.new(num, i, @mono.molecule(3))
        end
        break if $error
        @poly[i+1] = @mono.info
      end
      unless $error
        $cnt += 1
        puts $cnt
        break
      end
    end
  end

  def info
    @poly
  end
end

class Resist
  def initialize(degreePoly, totalMono)
    $resist = {}
    numPoly = totalMono / degreePoly
    overPoly = totalMono % degreePoly
    numPoly.times do |num|
      @poly = Poly.new(degreePoly, num+1)
      $resist[num+1] = @poly.info
    end
    $resist[numPoly+1] = Poly.new(overPoly, numPoly).info if overPoly != 0
  end

  def info
    $resist
  end
end

#一つ目のモノマー作成
# molecule2 = {x: 5, y: 5, z: 5, cs: 1, ss: 0, cf: 1, sf: 0, vx: 0, vy: 0, vz: 0}

# mono = Monomar.new(1, molecule2)
# p mono.info

resist = Resist.new(degreePoly, totalMono)

number = 0
n = 0
File.open("input.txt","w") do |data|
  File.open("pmma_new.pdb","w") do |text|
    $resist.each do |numPoly, poly|
      poly.each do |numMono, mono|
        n += 1
        mono.sort.to_h.each do |numMol, mol|
          number += 1
          text.printf("ATOM%7d  c    i   %3d    %8.2f%8.2f%8.2f\n", number, numMol, mol[:x]*10, mol[:y]*10, mol[:z]*10)
          data.printf("%5d%3d%5d%3d    %9.3f%9.3f%9.3f%11.5f%11.5f%11.5f\n", number, numMol, n, numPoly, mol[:x], mol[:y], mol[:z], mol[:vx], mol[:vy], mol[:vz])
        end
      end
    end
  end
end
