
RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

drop:
	rails db:drop

up:
	rails db:create
	rails db:migrate
	rake import:from_xlsx_departments
	rake import:from_xlsx_subjects
	rake import:from_xlsx_programs
	rake import:from_xlsx_applicants
	rake import:from_xlsx_achievements
	rake import:from_xlsx_applicant_achievements
	rake import:from_xlsx_program_subjects
	rake import:from_xlsx_program_applicants
	rake import:from_xlsx_applicant_subjects

migration:
	bundle exec rails g migration $(RUN_ARGS)

model:
	bundle exec rails g model $(RUN_ARGS)

create:
	bundle exec rails db:create

migrate:
	bundle exec rails db:migrate

rubocop:
	rubocop -A

run-console:
	bundle exec rails console

c: run-console

.PHONY:	db
