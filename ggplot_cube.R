library(ggplot2)
# devtools::install_github("coolbutuseless/threed")
library(threed)
library(dplyr)

obj <- threed::mesh3dobj$cube


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Define camera 'lookat' matrix i.e. camera-to-world transform
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
camera_to_world <- threed::look_at_matrix(eye = c(-1.5, 1.75, 4), at = c(0, 0, 0))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Transform the object into camera space and do perspective projection
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
obj <- obj %>%
  transform_by(invert_matrix(camera_to_world)) %>%
  perspective_projection()

ggplot(obj, aes(x, y)) +
  geom_point() +
  theme_void() +
  theme(legend.position = 'none') +
  coord_equal()

ggplot(obj, aes(x, y, group = element_id)) +
  geom_polygon(fill = NA, colour = 'black', size = 0.2) +
  theme_void() +
  theme(legend.position = 'none') +
  coord_equal()

ggplot(obj, aes(x, y, group = element_id)) +
  geom_polygon(fill = NA, colour='black', aes(linetype = hidden,  size = hidden)) +
  scale_linetype_manual(values = c('TRUE' = "dotted", 'FALSE' = 'solid')) +
  scale_size_manual(values = c('TRUE' = 0.2, 'FALSE' = 0.5)) +
  theme_void() +
  theme(legend.position = 'none') +
  coord_equal()

ggplot(obj, aes(x, y, group = zorder)) +
  geom_polygon(aes(fill = fny + fnz), colour = 'black', size = 0.2) +
  theme_void() +
  theme(legend.position = 'none') +
  coord_equal()


# ##################
# plotting a bunny
#  ############

camera_to_world <- look_at_matrix(eye = c(-1.5, 1.75, 4), at = c(0, 0, 0))

obj <- threed::mesh3dobj$bunny %>%
  transform_by(invert_matrix(camera_to_world)) %>%
  perspective_projection()

ggplot(obj, aes(x, y, group = element_id)) +
  geom_polygon(aes(fill = fnx + fny, colour = fnx + fny, group = zorder)) +
  theme_minimal() +
  theme(
    legend.position = 'none',
    axis.text       = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank(),
  ) +
  coord_equal() 

ggplot(obj, aes(x, y, group = element_id)) +
  geom_polygon(fill = NA, colour='black', aes(linetype = hidden,  size = hidden)) +
  scale_linetype_manual(values = c('TRUE' = "dotted", 'FALSE' = 'solid')) +
  scale_size_manual(values = c('TRUE' = 0.2, 'FALSE' = 0.5)) +
  theme_void() +
  theme(legend.position = 'none') +
  coord_equal()

ggplot(obj, aes(x, y, group = zorder)) +
  geom_polygon(aes(fill = fny + fnz), colour = 'black', size = 0.2) +
  theme_void() +
  theme(legend.position = 'none') +
  coord_equal()

# plot a cow, a teapot, a sphere, a icosahedron ... 


# more here https://github.com/coolbutuseless/threed