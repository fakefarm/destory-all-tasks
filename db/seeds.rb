Task.destroy_all if Rails.env.development?
Task.create(item: 'Take out the trash', tags: 'chore', user_id: 1)
Task.create(item: 'Clean my room', tags: 'chore', user_id: 1)
Task.create(item: 'Make my bed', tags: 'chore', user_id: 1)
Task.create(item: 'Learn to code', tags: 'school', user_id: 1)
Task.create(item: 'Read about Angular', tags: 'school', user_id: 1)
Task.create(item: 'Write better tests', tags: 'school', user_id: 1)
