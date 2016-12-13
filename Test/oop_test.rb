# Employees - ALL have a NAME, SERIAL NUMBER and EITHER FULLTIME OR PARTIME __ YES
# EXECUTIVES and MANAGERS, REGULAR are FULLTIME -- YES
# EXECUTIVES recive 20 days VACATION. # MANGERS recieve 14 days VACATION, REGULAR recieve 10 days VACATION
# EXecutives have a corner office, managers work at a desk in regular private office. Regular emplyess assigned to cubicle farm deskj.
# Part time work in open workspace no reserved desk.

#MANAGER prefix Mgr and EXE for EXECUTIVE

module Delegate
  def delegate
    true
  end
end

class Employee
  def initailize(name, serial)
    @name = name
    @serial_num = serial
  end
end

class FullTime < Employee
  def initailize(n, s)
    super(n, s)
    @vacation = 10
    @desk = find_free_desk
  end

  def find_free_desk
    ##
  end
end

class PartTime < Employee
  def initialize(n, s)
    super(n, s)
  end
end

class Executive < FullTime
  include Delegate

  def initailize(n, s)
    super(n, s)
    @vacation = 20
    @desk = 'corner office'
  end

  def name
    'Exe ' + @name
  end
end

class Manager < FullTime
  include CanDelegate

  def initialize(n, s)
    super(n, s)
    @vacation = 14
    @desk = 'private office'
  end

  def name
    'Mgr ' + @name
  end
end