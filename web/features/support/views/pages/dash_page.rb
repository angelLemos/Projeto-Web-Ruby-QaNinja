

class DashPage
  include Capybara::DSL

  def estar_na_dash?
    return page.has_css?(".dashboard")
  end

  def navegar_para_formulario_equipo
    click_button 'Criar anúncio'
  end

  def retornar_lista
    return find('.equipo-list')
  end
end