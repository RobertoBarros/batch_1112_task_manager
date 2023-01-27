require_relative 'router'
require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_controller'


repository = TaskRepository.new('tasks.csv')
controller = TasksController.new(repository)
router = Router.new(controller)

router.run
