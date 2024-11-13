# this script is for copying formatting
# TODO: make these themes or functions

# label ranges
# Label ranges for plotting
label_range_r2 <- r2_graph_data %>%
  dplyr::mutate(Year = format(month, "%Y")) %>%
  dplyr::group_by(Year) %>%
  dplyr::summarize(xmin = min(month), xmax = max(month), ymin = 0, ymax = max(r2_graph_data$value) * 1.1) %>%
  dplyr::mutate(xmid = as.Date((as.numeric(xmin) + as.numeric(xmax)) / 2, origin = "1970-01-01"))


# Bar graphs
  ggplot2::geom_rect(data = label_range, ggplot2::aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, group = Year),
                     fill = "white", color = NA, alpha = 0, inherit.aes = FALSE) +
  ggplot2::geom_text(data = label_range_12, ggplot2::aes(x = xmid, y = ymin - 5, label = Year, group = Year),
                     color = "#636363", size = 3.5, angle = 0, hjust = 0.5, inherit.aes = FALSE) +
  ggplot2::labs(title = NULL, x = "Date", y = "Percentage") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, hjust = 1)) +
  dluhctheme::dluhc_style(size = 1.5) +
  ggplot2::scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 105)) + #Adjust axis to accommodate rouding to more than 100%
  ggplot2::scale_x_date(labels = scales::date_format("%b"), date_breaks = "1 month", expand = c(0, 0)) +
  ggplot2::theme(
    axis.text.x = ggplot2::element_text(angle = 0, hjust = 1, vjust = 0.5, family = "Arial", color = "#636363", size = 10),
    axis.text.y = ggplot2::element_text(family = "Arial", color = "#636363", size = 10),
    panel.grid.major = ggplot2::element_line(color = "#F2F2F2", size = 0.3, linetype = "solid"),
    panel.grid.major.y = ggplot2::element_line(color = "#F2F2F2", size = 0.3, linetype = "solid"),
    axis.ticks = ggplot2::element_line(color = "#F2F2F2", size = 0.3)
  ) +
  ggplot2::theme(legend.position = "bottom", legend.direction = "horizontal", legend.key.size = grid::unit(0.3, "cm"),
                 legend.text = ggplot2::element_text(family = "Arial", color = "#7F7F7F", size = 10)
  ) +
  ggplot2::scale_fill_manual(values = c(shades_of_blue))


# line graphs
ggplot2::geom_line(ggplot2::aes(y = NR1, color = "NR1"), linewidth = 1.4, group = 1) +
    ggplot2::geom_point(ggplot2::aes(y = NR1), color = "#95B3D7", size = 3) +
    ggplot2::geom_line(ggplot2::aes(y = NR2, color = "NR2"), linewidth = 1.4, group = 1) +
    ggplot2::geom_point(ggplot2::aes(y = NR2), color = "#012169", size = 3) +
    # Adding labels directly to the lines
    ggplot2::geom_rect(data = label_range_X, ggplot2::aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, group = Year),
                       fill = "white", color = NA, alpha = 0, inherit.aes = FALSE) +
    ggplot2::geom_text(data = label_range_X, ggplot2::aes(x = xmid, y = ymin - 300, label = Year, group = Year),
                       color = "#636363", size = 3.5, angle = 0, hjust = 0.5, inherit.aes = FALSE) +
    ggplot2::geom_text(data = NR1_label, ggplot2::aes(x = Date, y = y, label = label),
                       color = "#012169", vjust = -0.5,
                       # hjust = -3.6,
                       size = 3.5) +
    ggplot2::geom_text(data = NR2_label, ggplot2::aes(x = Date, y = y, label = label),
                       color = "#012169", vjust = -0.5,
                       # hjust = -2.25,
                       size = 3.5) +
    ggplot2::labs(title = NULL, x = "Date", y = "Number of people") +
    ggplot2::theme(legend.position = "none") +
    ggplot2::scale_color_manual(values = c("NR1" = "#95B3D7", "NR2" = "#012169"), guide ='none') +
    dluhctheme::dluhc_style(size = 1.5) +
    ggplot2::scale_y_continuous(breaks = seq(0, 1500, by = 250), labels = scales::comma, limits = c(-300, 1500)) +
    ggplot2::scale_x_date(labels = scales::date_format("%b"), date_breaks = "1 month", expand = c(0, 10)) +
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(angle = 0, hjust = 0, vjust = 0.5, family = "Arial", color = "#636363", size = 10),
      axis.text.y = ggplot2::element_text(family = "Arial", color = "#636363", size = 10),
      panel.grid.major = ggplot2::element_line(color = "#F2F2F2", linewidth = 0.3, linetype = "solid"),
      panel.grid.major.y = ggplot2::element_line(color = "#F2F2F2", linewidth = 0.3, linetype = "solid"),
      axis.ticks = ggplot2::element_line(color = "#F2F2F2", size = 0.3)
    )


# pie/doughnut charts
  ggplot2::geom_text(data = subset(donut_data, Institutions != "UK armed forces"), ggplot2::aes(x = 4, y = labelPosition, label = label), size = 4, color = "white") +
    ggplot2::geom_text(data = subset(donut_data, Institutions == "UK armed forces"), ggplot2::aes(x = 5.75, y = custom_labelPosition, label = label), size = 4, color = "#767171") +
    ggplot2::geom_segment(data = subset(donut_data, Institutions == "UK armed forces"), ggplot2::aes(x = 4, y = original_label_position, xend = 5.45, yend = custom_labelPosition), color = "#767171", size = 0.5) +
    ggplot2::coord_polar(theta = "y") +
    ggplot2::xlim(c(0, 6)) +
    ggplot2::scale_fill_manual(values = colors) +
    ggplot2::theme_void() +
    ggplot2::theme(
      text = ggplot2::element_text(family = "Arial", color = "#7F7F7F"),
      legend.position = "bottom",
      legend.title = ggplot2::element_blank(),
      legend.margin = ggplot2::margin(t = -25, b = 0, l = 0, r = 0),
      legend.box.margin = ggplot2::margin(t = -25, b = 10, l = 0, r = 0)) +
    ggplot2::annotate("text", x = 1, y = 0, label = total_value, size = 18, color = "#012169", fontface = "bold") +
    ggplot2::annotate("text", x = 0, y = 0, label = "\n \n \n People sleeping rough \n over the month who left\n an institution", size = 4, color = "#767171", fontface = "bold", family = "Arial")
