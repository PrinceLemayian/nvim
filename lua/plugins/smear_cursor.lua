return {
  "sphamba/smear-cursor.nvim",
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    smear_insert_mode = true,
    smear_to_cmd = true,
    scroll_buffer_space = true,

    stiffness = 0.35,
    trailing_stiffness = 0.15,
    trailing_exponent = 3,

    damping = 0.82,
    anticipation = 0.2,

    distance_stop_animating = 0.3,
    time_interval = 12,

    stiffness_insert_mode = 0.5,
    trailing_stiffness_insert_mode = 0.3,
    damping_insert_mode = 0.9,
  },
}
