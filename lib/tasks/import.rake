# frozen_string_literal: true

require 'roo'

namespace :import do
  desc 'Import data from xlsx files'

  data = Roo::Spreadsheet.open('db/import.xlsx')

  task from_xlsx_departments: :environment do
    puts 'Importing Data Departments'

    sheet = data.sheet(0)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      department_data = [headers, row].transpose.to_h

      if Department.exists?(name_department: department_data['name_department'])
        puts "Department with title #{department_data['name_department']} already exists"

        next
      end

      department = Department.new(department_data)

      puts "Saving Department with title '#{department.name_department}'"

      department.save!
    end
  end

  task from_xlsx_subjects: :environment do
    puts 'Importing Data Subjects'

    sheet = data.sheet(1)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      subject_data = [headers, row].transpose.to_h

      if Subject.exists?(name_subject: subject_data['name_subject'])
        puts "Subject with title #{subject_data['name_subject']} already exists"

        next
      end

      subject = Subject.new(subject_data)

      puts "Saving Subject with title '#{subject.name_subject}'"

      subject.save!
    end
  end

  task from_xlsx_programs: :environment do
    puts 'Importing Data Programs'

    sheet = data.sheet(2)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      program_data = [headers, row].transpose.to_h

      if Program.exists?(name_program: program_data['name_program'])
        puts "Program with title #{program_data['name_program']} already exists"

        next
      end

      program = Program.new(program_data)

      puts "Saving Program with title '#{program.name_program}'"

      program.save!
    end
  end

  task from_xlsx_applicants: :environment do
    puts 'Importing Data Applicants'

    sheet = data.sheet(3)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      applicant_data = [headers, row].transpose.to_h

      if Applicant.exists?(name_applicant: applicant_data['name_applicant'])
        puts "Applicant with name #{applicant_data['name_applicant']} already exists"

        next
      end

      applicant = Applicant.new(applicant_data)

      puts "Saving Applicant with name '#{applicant.name_applicant}'"

      applicant.save!
    end
  end

  task from_xlsx_achievements: :environment do
    puts 'Importing Data Achievements'

    sheet = data.sheet(4)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      achievement_data = [headers, row].transpose.to_h

      if Achievement.exists?(name_achievement: achievement_data['name_achievement'])
        puts "Achievement with title #{achievement_data['name_achievement']} already exists"

        next
      end

      achievement = Achievement.new(achievement_data)

      puts "Saving Achievement with title '#{achievement.name_achievement}'"

      achievement.save!
    end
  end

  task from_xlsx_applicant_achievements: :environment do
    puts 'Importing Data Applicant_Achievements'

    sheet = data.sheet(5)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      applicant_achievement_data = [headers, row].transpose.to_h

      applicant_achievement = ApplicantAchievement.new(applicant_achievement_data)

      puts 'Loading of ApplicantAchievement staging table completed successfully!'

      applicant_achievement.save!
    end
  end

  task from_xlsx_program_subjects: :environment do
    puts 'Importing Data Program_Subjects'

    sheet = data.sheet(6)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      program_subject_data = [headers, row].transpose.to_h

      program_subject = ProgramSubject.new(program_subject_data)

      puts 'Loading of ProgramSubject staging table completed successfully!'

      program_subject.save!
    end
  end

  task from_xlsx_program_applicants: :environment do
    puts 'Importing Program_Applicants'

    sheet = data.sheet(7)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      program_applicant_data = [headers, row].transpose.to_h

      program_applicant = ProgramApplicant.new(program_applicant_data)

      puts 'Loading of ProgramApplicant staging table completed successfully!'

      program_applicant.save!
    end
  end

  task from_xlsx_applicant_subjects: :environment do
    puts 'Importing Data Applicant_Subjects'

    sheet = data.sheet(8)

    headers = sheet.row(1)

    sheet.each_with_index do |row, idx|
      next if idx.zero?

      applicant_subject_data = [headers, row].transpose.to_h

      applicant_subject = ApplicantSubject.new(applicant_subject_data)

      puts 'Loading of ApplicantSubject staging table completed successfully!'

      applicant_subject.save!
    end
  end
end
