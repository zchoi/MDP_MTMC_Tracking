function tracker = initialize(fr, dres_image, id, dres, ind, tracker)

if tracker.state ~= 1
    return;
else  % active

    % initialize the LK tracker
    tracker = LK_initialize(tracker, fr, id, dres, ind, dres_image);
    tracker.state = 2;
    tracker.streak_occluded = 0;
    tracker.streak_tracked = 0;

    % build the dres structure
    dres_one.fr = dres.fr(ind);
    dres_one.id = tracker.target_id;
    dres_one.x = dres.x(ind);
    dres_one.y = dres.y(ind);
    dres_one.w = dres.w(ind);
    dres_one.h = dres.h(ind);
    dres_one.r = dres.r(ind);
    dres_one.state = tracker.state;
    tracker.dres = dres_one;
end