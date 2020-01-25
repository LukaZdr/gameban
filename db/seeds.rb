# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


project_1 = Project.where(name: 'Project Jet', description: 'lets make it fly').first_or_create
project_2 = Project.where(name: 'Project beam of light', description: 'lets enlighten the future').first_or_create
project_3 = Project.where(name: 'Project paper cut', description: 'its going to be a tough road').first_or_create

Sprint.create(project_id: project_1.id,
              start_time: Date.today,
              length: 3,
              quality_1: 'Security',
              quality_2: 'Understandability',
              quality_3: 'Time behaviour',
              quality_4: 'Analyzability',
              quality_5: 'Recoverability')
Sprint.create(project_id: project_2.id,
              start_time: Date.today,
              length: 3,
              quality_1: 'Security',
              quality_2: 'Understandability',
              quality_3: 'Time behaviour',
              quality_4: 'Analyzability',
              quality_5: 'Recoverability')
Sprint.create(project_id: project_2.id,
              start_time: Date.today,
              length: 3,
              quality_1: 'Security',
              quality_2: 'Understandability',
              quality_3: 'Time behaviour',
              quality_4: 'Analyzability',
              quality_5: 'Recoverability')
