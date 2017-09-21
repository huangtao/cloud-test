
local function create_ps_node(ps, node_data)
    local ps_node = PSNode(node_data.name)
    if node_data.pos then ps_node:set_translate(node_data.pos) end
    return ps_node
end

local function create_ps_camera(ps, camera_data)
    local ps_camera = PSCamera(camera_data.name)
    if camera_data.pos then ps_camera:set_translate(camera_data.pos) end

    local look_at = camera_data.look_at or Point3(0.0, 0.0, 0.0)
    local up = camera_data.up or Point3(0.0, 1.0, 0.0)
    ps_camera:look_at_world_point(look_at, up)

    if camera_data.view_port then ps_camera.view_port = camera_data.view_port end

    if camera_data.frustum then
        ps_camera:set_view_frustum(
            camera_data.frustum.left,
            camera_data.frustum.right,
            camera_data.frustum.top,
            camera_data.frustum.bottom,
            camera_data.frustum.near,
            camera_data.frustum.far,
            camera_data.frustum.ortho
            )
    end

    return ps_camera
end

local function create_emitter(ps, emitter_data)
    local ps_node = ps:get_node(emitter_data.emitter_obj)

    local emitter_types = {
        ['Box'] = function()
            return PSBoxEmitter(
                emitter_data.name,
                emitter_data.emitter_width,
                emitter_data.emitter_height,
                emitter_data.emitter_depth,
                ps_node,
                emitter_data.speed,
                emitter_data.speed_var,
                emitter_data.speed_flip_ratio,
                math.rad(emitter_data.declination),
                math.rad(emitter_data.declination_var),
                math.rad(emitter_data.planar_angle),
                math.rad(emitter_data.planar_angle_var),
                emitter_data.size,
                emitter_data.size_var,
                emitter_data.life_span,
                emitter_data.life_span_var,
                math.rad(emitter_data.rotation_angle),
                math.rad(emitter_data.rotation_angle_var),
                math.rad(emitter_data.rotation_speed),
                math.rad(emitter_data.rotation_speed_var),
                emitter_data.random_rotation_speed_sign,
                emitter_data.rot_axis,
                emitter_data.random_rotation_axis
            )
        end,
        ['Cylinder'] = function()
            return PSCylinderEmitter(
                emitter_data.name,
                emitter_data.emitter_radius,
                emitter_data.emitter_height,
                ps_node,
                emitter_data.speed,
                emitter_data.speed_var,
                emitter_data.speed_flip_ratio,
                math.rad(emitter_data.declination),
                math.rad(emitter_data.declination_var),
                math.rad(emitter_data.planar_angle),
                math.rad(emitter_data.planar_angle_var),
                emitter_data.size,
                emitter_data.size_var,
                emitter_data.life_span,
                emitter_data.life_span_var,
                math.rad(emitter_data.rotation_angle),
                math.rad(emitter_data.rotation_angle_var),
                math.rad(emitter_data.rotation_speed),
                math.rad(emitter_data.rotation_speed_var),
                emitter_data.random_rotation_speed_sign,
                emitter_data.rot_axis,
                emitter_data.random_rotation_axis
            )
        end,
        ['Sphere'] = function()
            return PSSphereEmitter(
                emitter_data.name,
                emitter_data.emitter_radius,
                ps_node,
                emitter_data.speed,
                emitter_data.speed_var,
                emitter_data.speed_flip_ratio,
                math.rad(emitter_data.declination),
                math.rad(emitter_data.declination_var),
                math.rad(emitter_data.planar_angle),
                math.rad(emitter_data.planar_angle_var),
                emitter_data.size,
                emitter_data.size_var,
                emitter_data.life_span,
                emitter_data.life_span_var,
                math.rad(emitter_data.rotation_angle),
                math.rad(emitter_data.rotation_angle_var),
                math.rad(emitter_data.rotation_speed),
                math.rad(emitter_data.rotation_speed_var),
                emitter_data.random_rotation_speed_sign,
                emitter_data.rot_axis,
                emitter_data.random_rotation_axis
            )
        end,
        ['Torus'] = function()
            return PSTorusEmitter(
                emitter_data.name,
                emitter_data.emitter_radius,
                emitter_data.emitter_section_radius,
                ps_node,
                emitter_data.speed,
                emitter_data.speed_var,
                emitter_data.speed_flip_ratio,
                math.rad(emitter_data.declination),
                math.rad(emitter_data.declination_var),
                math.rad(emitter_data.planar_angle),
                math.rad(emitter_data.planar_angle_var),
                emitter_data.size,
                emitter_data.size_var,
                emitter_data.life_span,
                emitter_data.life_span_var,
                math.rad(emitter_data.rotation_angle),
                math.rad(emitter_data.rotation_angle_var),
                math.rad(emitter_data.rotation_speed),
                math.rad(emitter_data.rotation_speed_var),
                emitter_data.random_rotation_speed_sign,
                emitter_data.rot_axis,
                emitter_data.random_rotation_axis
            )
        end,
        ['Curve'] = function()
            local curve_parent_node = ps:get_node(emitter_data.curve_parent or '')
            local curve = PSCurve3()
            curve:initialize(emitter_data.curve.degree, emitter_data.curve.control_points, emitter_data.curve.knots)
            return PSCurveEmitter(
                emitter_data.name,
                curve_parent_node,
                ps_node,
                curve,
                emitter_data.speed,
                emitter_data.speed_var,
                emitter_data.speed_flip_ratio,
                math.rad(emitter_data.declination),
                math.rad(emitter_data.declination_var),
                math.rad(emitter_data.planar_angle),
                math.rad(emitter_data.planar_angle_var),
                emitter_data.size,
                emitter_data.size_var,
                emitter_data.life_span,
                emitter_data.life_span_var,
                math.rad(emitter_data.rotation_angle),
                math.rad(emitter_data.rotation_angle_var),
                math.rad(emitter_data.rotation_speed),
                math.rad(emitter_data.rotation_speed_var),
                emitter_data.random_rotation_speed_sign,
                emitter_data.rot_axis,
                emitter_data.random_rotation_axis
            )
        end,
    }

    local emitter = emitter_types[emitter_data.emitter_type]()

    if emitter_data.default_direction then emitter.default_direction = emitter_data.default_direction end

    return emitter
end

local function create_emitter_controller(ps, emitter_ctrl_data)
    local emitter_ctrl_types = {
        ['EmitParticles'] = function()
            local emit_particles_ctrl = PSEmitParticlesCtlr(emitter_ctrl_data.emitter_name)

            if emitter_ctrl_data.birth_rate_ctrl and emitter_ctrl_data.birth_rate_ctrl.frames then
                local birth_rate_ctrl = emit_particles_ctrl:get_birth_rate_ctrl()
                for _,frame in ipairs(emitter_ctrl_data.birth_rate_ctrl.frames) do
                    birth_rate_ctrl:insert_frame(frame.time, frame.value)
                end
                birth_rate_ctrl:start()
            end

            if emitter_ctrl_data.active_ctrl and emitter_ctrl_data.active_ctrl.frames then
                local active_ctrl = emit_particles_ctrl:get_active_ctrl()
                for _,frame in ipairs(emitter_ctrl_data.active_ctrl.frames) do
                    active_ctrl:insert_frame(frame.time, frame.value)
                end
                active_ctrl:start()
            end

            return emit_particles_ctrl
        end,
        ['FloatCtrl'] = function()
            local float_ctrl = PSEmitterFloatCtrl(emitter_ctrl_data.emitter_name, emitter_ctrl_data.attr_type)

            local key_frame_ctrl = float_ctrl:get_key_frame_ctrl()
            key_frame_ctrl.cycle_type = emitter_ctrl_data.cycle_type

            if emitter_ctrl_data.frames then
                for _,frame in ipairs(emitter_ctrl_data.frames) do
                    key_frame_ctrl:insert_frame(frame.time, frame.value)
                end
                key_frame_ctrl:start()
            end

            return float_ctrl
        end,
    }

    local emitter_ctrl = emitter_ctrl_types[emitter_ctrl_data.emitter_ctrl_type]()
    emitter_ctrl:set_target(ps)

    return emitter_ctrl
end

local function create_force(ps, force_data)
    local ps_node = ps:get_node(force_data.force_obj)

    local force_types = {
        ['BombForce'] = function()
            return PSBombForce(
                force_data.name,
                ps_node,
                force_data.bomb_axis,
                force_data.decay,
                force_data.delta_v,
                force_data.decay_type,
                force_data.symm_type
            )
        end,
        ['DragForce'] = function()
            return PSDragForce(
                force_data.name,
                ps_node,
                force_data.drag_axis,
                force_data.percentage,
                force_data.range,
                force_data.range_falloff
            )
        end,
        ['AirFieldForce'] = function()
            return PSAirFieldForce(
                force_data.name,
                ps_node,
                force_data.magnitude,
                force_data.attenuation,
                force_data.use_max_distance,
                force_data.max_distance,
                force_data.direction,
                force_data.air_friction,
                force_data.inherited_velocity,
                force_data.inherit_rotation,
                force_data.enable_spread,
                force_data.spread
            )
        end,
        ['DragFieldForce'] = function()
            return PSDragFieldForce(
                force_data.name,
                ps_node,
                force_data.magnitude,
                force_data.attenuation,
                force_data.use_max_distance,
                force_data.max_distance,
                force_data.use_direction,
                force_data.direction
            )
        end,
        ['GravityFieldForce'] = function()
            return PSGravityFieldForce(
                force_data.name,
                ps_node,
                force_data.magnitude,
                force_data.attenuation,
                force_data.use_max_distance,
                force_data.max_distance,
                force_data.direction
            )
        end,
        ['RadialFieldForce'] = function()
            return PSRadialFieldForce(
                force_data.name,
                ps_node,
                force_data.magnitude,
                force_data.attenuation,
                force_data.use_max_distance,
                force_data.max_distance,
                force_data.radial_factor
            )
        end,
        ['TurbulenceFieldForce'] = function()
            return PSTurbulenceFieldForce(
                force_data.name,
                ps_node,
                force_data.magnitude,
                force_data.attenuation,
                force_data.use_max_distance,
                force_data.max_distance,
                force_data.frequency
            )
        end,
        ['VortexFieldForce'] = function()
            return PSVortexFieldForce(
                force_data.name,
                ps_node,
                force_data.magnitude,
                force_data.attenuation,
                force_data.use_max_distance,
                force_data.max_distance,
                force_data.direction
            )
        end,
        ['GravityForce'] = function()
            return PSGravityForce(
                force_data.name,
                ps_node,
                force_data.gravity_axis,
                force_data.decay,
                force_data.strength,
                force_data.gravity_force_type,
                force_data.turbulence,
                force_data.turbulence_scale
            )
        end,
    }

    local force = force_types[force_data.force_type]()
    force.active = force_data.active

    return force
end

local function create_collider(ps, spawner, collider_data)
    local ps_node = ps:get_node(collider_data.collider_obj)

    local collider_types = {
        ['PlanarCollider'] = function()
            return PSPlanarCollider(
                collider_data.bounce,
                collider_data.spawn_on_collide,
                collider_data.die_on_collide,
                spawner,
                ps_node,
                collider_data.width,
                collider_data.height,
                collider_data.x_axis,
                collider_data.y_axis
            )
        end,
        ['SphericalCollider'] = function()
            return PSSphericalCollider(
                collider_data.bounce,
                collider_data.spawn_on_collide,
                collider_data.die_on_collide,
                spawner,
                ps_node,
                collider_data.radius
            )
        end,
    }

    return collider_types[collider_data.collider_type]()
end

local function create_spawner(spawner_data)
    return PSSpawner(
        spawner_data.num_spawn_generations,
        spawner_data.percentage_spawned,
        spawner_data.min_num_to_spawn,
        spawner_data.max_num_to_spawn,
        spawner_data.spawn_speed_factor,
        spawner_data.spawn_speed_factor_var,
        spawner_data.spawn_dir_chaos,
        spawner_data.life_span,
        spawner_data.life_span_var,
        spawner_data.relative_speed
        )
end

local function create_particle_systme(ps_data)
    local has_animated_textures = false

    local has_rotations = false
    if ps_data.general_data and ps_data.general_data.rotation_frames then has_rotations = true end

    local has_colors = false
    if ps_data.general_data and ps_data.general_data.color_frames then has_colors = true end

    local has_living_spawner = false
    local living_spawner = ps_data.living_spawner and create_spawner(ps_data.living_spawner) or nil
    if living_spawner then has_living_spawner = true end

    local dynamic_bounds = false
    local create_default_generator = false

    local ps = PSParticleSystem.create(
        ps_data.max_num_particles,
        ps_data.normal_method,
        ps_data.normal_direction,
        ps_data.up_method,
        ps_data.up_direction,
        has_living_spawner,
        has_colors,
        has_rotations,
        has_animated_textures,
        ps_data.world_space,
        dynamic_bounds,
        create_default_generator
    )

    ps.src_blend_alpha = ps_data.src_blend_alpha
    ps.src_blend_rgb = ps_data.src_blend_rgb
    ps.dst_blend_alpha = ps_data.dst_blend_alpha
    ps.dst_blend_rgb = ps_data.dst_blend_rgb

    if ps_data.texture then
        ps:set_unit(TextureUnit(TextureCache.instance():get(ps_data.texture)))
    else
        ps_data:set_unit(TextureUnit.default_unit())
    end

    for _,node_data in ipairs(ps_data.ps_nodes) do
        ps:add_node(create_ps_node(ps, node_data))
    end

    if ps_data.camera then
        ps.camera = create_ps_camera(ps, ps_data.camera)
    end

    for _,emitter_data in ipairs(ps_data.emitters or {}) do
        ps:add_emitter(create_emitter(ps, emitter_data))
    end

    for _,emitter_ctrl_data in ipairs(ps_data.emitter_controllers) do
        ps:add_controller(create_emitter_controller(ps, emitter_ctrl_data))
    end

    for _,force_data in ipairs(ps_data.forces or {}) do
        ps:add_force(create_force(ps, force_data))
    end

    local death_spawner = ps_data.death_spawner and create_spawner(ps_data.death_spawner) or nil
    if death_spawner then ps:set_death_spawner(death_spawner) end

    if living_spawner then ps:set_living_spawner(living_spawner) end

    for _,collider_data in ipairs(ps_data.colliders or {}) do
        local collider = create_collider(ps, death_spawner, collider_data)
        collider.active = collider_data.active
        ps:add_collider(collider)
    end

    if ps_data.general_data then
        ps.grow_time = ps_data.general_data.grow_time
        ps.shrink_time = ps_data.general_data.shrink_time
        ps.grow_generation = ps_data.general_data.grow_generation
        ps.shrink_generation = ps_data.general_data.shrink_generation

        ps.size_loop_behavior = ps_data.general_data.size_loop_behavior
        for _,frame_data in ipairs(ps_data.general_data.size_frames or {}) do
            ps:insert_size_frame(frame_data.time, frame_data.value)
        end

        if ps_data.general_data.color_frames then
            ps.color_loop_behavior = ps_data.general_data.color_loop_behavior
            for _,frame_data in ipairs(ps_data.general_data.color_frames) do
                ps:insert_color_frame(frame_data.time, frame_data.value)
            end
        end

        if ps_data.general_data.rotation_frames then
            ps.rotation_loop_behavior = ps_data.general_data.rotation_loop_behavior
            for _,frame_data in ipairs(ps_data.general_data.rotation_frames or {}) do
                ps:insert_rotation_frame(frame_data.time, frame_data.value)
            end
        end
    end

    -- 由于旋转的存在，这里使用双面渲染
    ps.double_sided = true

    return ps
end

return create_particle_systme
