%Find files
mex_path = which('lsl_destroy_streaminfo.c');
mex_path = mex_path(1:end-24);
cd(mex_path);

%For sending markers to Muse stream
mex lsl_loadlib_.c
mex lsl_push_sample.c
mex lsl_destroy_streaminfo.c
mex lsl_create_streaminfo.c
mex lsl_get_nominal_srate.c
mex lsl_create_outlet.c
mex lsl_resolve_byprop_.c
mex lsl_get_channel_count.c
mex lsl_destroy_outlet.c
mex lsl_freelib_.c

%For receiving Muse stream in matlab
mex lsl_get_channel_format.c
mex lsl_create_inlet.c
mex lsl_pull_sample_d.c
mex lsl_destroy_inlet.c
mex lsl_resolve_bypred_.c