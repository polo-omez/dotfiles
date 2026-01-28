return {
  {
    'saghen/blink.cmp',
    -- Usa una versión estable
    version = 'v0.*',
    
    -- Configuración básica
    opts = {
      -- 'default' incluye atajos básicos:
      -- C-space: mostrar menú
      -- Enter: aceptar
      -- Tab/Shift-Tab: navegar selección
      keymap = { preset = 'default' },

      appearance = {
        -- Configura iconos para tipos de completado (función, variable, etc.)
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      -- Fuentes de donde sacar las palabras (LSP, texto del buffer, rutas, etc.)
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      
      -- Habilitar firma de funciones (ayuda visual de argumentos mientras escribes)
      signature = { enabled = true }
    },
    
    -- Hack necesario para que blink descargue su binario precompilado
    -- si no tienes cargo/rust instalado
    opts_extend = { "sources.default" }
  }
}
