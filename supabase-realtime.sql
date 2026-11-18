-- Run once in Supabase → SQL Editor: turns on live sync between devices
alter publication supabase_realtime add table public.workclock;
alter table public.workclock replica identity full;
