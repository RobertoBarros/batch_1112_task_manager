require_relative 'tasks_view'

class TasksController

  def initialize(repository)
    @repository = repository
    @view = TasksView.new

  end

  def list
    # 1. Pegar todas as task do repository
    tasks = @repository.all

    # 2. Mandar as tasks para a view exibir
    @view.display(tasks)
  end

  def add
    # 1. Pegar a descricao da task da view
    description = @view.ask_description

    # 2. Instanciar a task
    new_task = Task.new(description)

    # 3. Criar a task no repository
    @repository.create(new_task)
  end

  def remove
    # Listar as tasks
    list

    # Perguntar qual o index da task a ser removida na view
    index = @view.ask_index

    # Mandar o repository destruir a task pelo index
    @repository.destroy(index)
  end

  def mark_as_done
    # Listar as tasks
    list

    # Perguntar o index da task a ser marcada
    index = @view.ask_index

    # Recuperar a task do repository
    task = @repository.find(index)

    # Marcar a task como done
    task.done!

    # Mandar o repository salvar os dados
    @repository.save_csv
  end

end
