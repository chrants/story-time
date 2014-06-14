# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'test/unit'

module Seed
    include MyRailsDebugger
    @@UPLOAD_TYPE_SEED =
    			[
    				{ name: 'presentation' },
    				{ name: 'skillsheet' },
    				{ name: 'activity' },
    				{ name: 'lab' }
    			]

    @@SUBJECT_SEED =
    			[
    				{
    					name: 'Middle School Space Science',
    					topics: ['Moon', 'Sun', 'Solar System', 'Black Holes']
    				},
    				{
    					name: 'Middle School Earth Science',
    					topics: []
    				},
    				{
    					name: 'Middle School Science',
    					topics: []
    				},
                    {
                        name: 'Astronomy',
                        topics: []
                    },
    				{
    					name: 'Physics',
    					topics: ['Electricity', 'Magnetism', 'Mechanics',
    							'Pulleys', 'Springs', 'Force', 'Motion',
    							'Vectors', 'Displacement', 'Gravity',
    							'Scientific notation', 'Pressure', 'Fluids',
    							'Fluid motion', 'Periodic motion']
    				},
    				{
    					name: 'Chemistry',
    					topics: ['Gas Laws', 'Noble Gasses', 'Batteries',
    							'Stoichiometry', 'Scientific notation',
    							'Acids', 'Bases', 'pH', 'Pressure', 'Volume',
    							'Periodic table', 'Water']
    				},
    				{
    					name: 'Biology',
    					topics: ['Populations', 'Phyla', 'Plants', 'Animals',
    							'Flowering plants', 'Baceria', 'Viruses',
    							'Genetics', 'DNA', 'RNA', 'Proteins', 'Fats',
    							'Lipids', 'Nucleotides', 'Energy flow',
    							'Biospheres', 'Water']
    				},
    				{
    					name: 'World History',
    					topics: ['Ancient rome', 'Ancient greece', 'Dark ages',
    							'Industial revolution', 'Black plague', 'Fossils',
    							'Prehistoric civilizations', 'WWI', 'WWII',
    							'French revolution', 'Communism', 'Republicanism',
    							'Socialism']
    				},
    				{
    					name: 'US History',
    					topics: ['Civil war', 'WWI', 'WWII', 'American revolution',
    							'Slavery', 'Seeing red', 'Communism',
    							'Republicanism', 'Guilded age', 'Roaring twenties',
    							'Segregation', 'Socialism', 'Great migration',
    							'Triangular trade', 'Declaration of independence',
    							'Constitution']
    				},
    				{
    					name: 'Economics',
    					topics: ['Gold standard', 'Silver standard', 'Communism',
    							'Price', 'Supply', 'Demand', 'Supply and Demand',
                                'Loanable Funds', 'Capitalism', 'Investment', 'PPCs']
    				},
    				{
    					name: 'Government',
    					topics: ['Republicanism', 'Socialism', 'Communism']
    				},
    				{
    					name: 'Geometry',
    					topics: ['Circles', 'Triangles', 'Rectangles', 'Squares',
    							'Polygons', 'Cubes', 'Spheres', '3D', '2D',
    							'Pythagorean theorem', 'Volume', 'Area',
    							'Perimeter', 'Quadrilaterals']
    				},
    				{
    					name: 'Calculus',
    					topics: ['Functions', 'Limits', 'Relations', 'FTC',
    							'Populations', 'Trigonometry']
    				},
    				{
    					name: 'Trigonometry',
    					topics: ['Pythagorean theorem', 'Inverse Functions']
    				},
    				{
    					name: 'Statistics',
    					topics: ['Mean', 'Median', 'Mode', 'Standard deviation',
    							'z-index', 'Graphs', 'Charts', 'Randomness']
    				},
    				{
    					name: 'Algebra',
    					topics: ['Functions', 'Exponential', 'Quadratic', 'Cubic',
    							'Polynomials', 'Absolute value', 'Slope']
    				}
    			]

    @@SCHOOL_SEED =
    			[

                ]

    @@USER_SEED =
    			[
    				{
    				    name: 'Christian Tschoepe',
    				    emails: [
    				        'christian.tschoepe@rackspace.com',
                            'tschoepe.christian@gmail.com',
                            'chriswins2much@yahoo.com',
                            'chriswins2much@gmail.com'
    				    ],
    				    password: 'asdf'
    				},
                    {
                        name: 'Jonathon Peacher',
                        emails: [
                            'djpeacher@gmail.com',
                            'djp0914423@gmail.com'
                        ],
                        password: 'asdf'
                    },
    				{
    				    name: 'Joe Smith',
    				    emails: [
    				        'joe.smith@gmail.com'
    				    ],
    				    password: 'asdf'
    				},
    				{
    				    name: 'Joe Schmoe',
    				    emails: [
    				        'schmoe.master@gmail.com'
    				    ],
    				    password: 'asdf'
    				},
    				{
    				    name: 'George Monkey',
    				    emails: [
    				        'curious_george@gmail.com'
    				    ],
    				    password: 'asdf'
    				},
    				{
    				    name: 'Allen Gross',
    				    emails: [
    				        'sky.faller@gmail.com'
    				    ],
    				    password: 'asdf'
    				},
    				{
    				    name: 'Boy B. Gone',
    				    emails: [
    				        'repellant@gmail.com'
    				    ],
    				    password: 'asdf'
    				}
    			]

   

    @@ADMIN_SEED =
    			[
    				{
    				    name: 'Alan Gnospelius',
    				    emails: ['agnospelius@satx.rr.com'],
    				    password: 'asdf'
    				},
    				{
    				    name: 'Other Dude',
    				    emails: ['dudetheadmin@admin.com'],
    				    password: 'asdf'
    				}
    			]

    @@UPLOAD_SEED = []

    def self.seed_upload_types()
        @@UPLOAD_TYPE_SEED.each do |this|
            UploadType.first_or_create this
        end
        UploadType.all.length > 0
    end

    def self.seed_subjects()
      @@SUBJECT_SEED.each do |subject_hash|
        topics = subject_hash[:topics]
        subject = Subject.first_or_create name: subject_hash[:name].downcase
        topics.each do |topic_name|
          topic = Topic.first_or_create name: topic_name.downcase
          subject.topics << topic unless subject.topics.include? topic
        end
        subject.topics.save
        subject.save
      end

      Subject.all.length > 0
    end

    def self.seed_uploads()        
      upload_entries = Dir::entries(Rails.root.join 'uploads')
      upload_entries.delete '.' if upload_entries.include? '.'
      upload_entries.delete '..' if upload_entries.include? '..'

      upload_entries.each do |entry|
        upload = {
          filename: entry,
          path: Rails.root.join('uploads', entry),
          approved: rand_bool,
          title: "#{rand_word} #{rand_word}",
          description: "#{rand_word} #{rand_word} #{rand_word} #{rand_word} #{rand_word} #{rand_word}.",
          content_type: 'text/application', #to default
          token: rand_token
        }
        @@UPLOAD_SEED << upload
      end

      @@UPLOAD_SEED.each do |this|
        upload_hash = this.plus(member: rand_instance(Member))
        upload = Upload.create upload_hash
        upload.save
        random(1, 10).times do
          rsub = rand_instance Subject
          rtop = rsub.topics.random
          exec "echo '#{rsub}'"
          upload.subjects << rsub unless upload.subjects.include? rsub and not rsub
          upload.topics << rtop unless upload.topics.include? rtop and not rtop
        end
      end
      Upload.all.length > 0
    end

    def self.seed_schools()
      @@SCHOOL_SEED.each do |this|
        School.create! this
      end
      School.all.length > 0
    end

    def self.seed_users()
        @@USER_SEED.each do |this|
            user_hash = this.and token: rand_token(), created: true
            user = User.create! user_hash.not 'emails'        
            init_emails user_hash[:emails], user
            #puts user.errors.inspect
        end


        @@MEMBER_SEED.each do |this|
            user = Email.get(this[:email]).user
            # Upgrades any predefined users that are also in the @@MEMBER_SEED
            if user
                user.type = Member
                user.save!
                #puts user.errors.inspect unless user.save!
            # Else creates it as a new member.
            else
                member_hash = this.merge token: rand_token(), created: true
                member = Member.create! member_hash.not 'emails'
                init_emails member_hash[:emails], member
                #puts member.errors.inspect unless member.save!
            end
        end


        @@ADMIN_SEED.each do |this|
            admin_hash = this.merge token: rand_token(), created: true
            admin = Admin.create! admin_hash.not 'emails'
            init_emails admin_hash[:emails], admin
            #puts admin.errors.inspect unless admin.save!
        end

        User.all.length > 0
    end

    def self.seed_all()
        upload_types_seeded = seed_upload_types()
        subjects_seeded = seed_subjects()
        schools_seeded = seed_schools()
        users_seeded = seed_users()

        if users_seeded and subjects_seeded and upload_types_seeded
            seed_uploads()
        end

        # :::::NOT WORKING:::::
        puts 'About to check status of population..'
        models = [UploadType, Subject, Topic, User, Member, Admin, Upload]

        models.each do |m|
            test_is_populated m
        end
    end

    def self.init_emails(list, user)
        emails = []
        list.each do |e|
            emails += Email.first_or_create(name: e)
        end
        init_emails2 emails, user
    end
    def self.init_emails2(list, user)
        list.each do |e| 
            user.emails << e
        end
        user.save!
    end
    
    def self.clear
        DataMapper.auto_migrate!
    end

    def self.test_is_populated(model)
        is_pop = model.all.length > 0
        print "Checking if #{model.name} is populated.. \t"
        puts (is_pop) ? "yes" : "no"
        is_pop
    end

end

#Seed::seed() unless User.all.length > 0
unless $no_seed
  puts 'About to seed'
  Seed::seed_all()
end