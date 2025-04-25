-- The Multi-clustering helps us to distribute the workload
-- Autoscaling could be defined

-- Consider:
-- Peak hours
-- Complex queries

-- Criteria (When to start an additional cluster?):
-- Standard: Favors starting additional warehouses (Performance)
--      Cluster starts immediately when either:
--      * A query is queued
--      * The system detects that are more queries than can be executed by the currently available clusters
--      Cluster shuts down after 2 or 3 succesful checks (1 min invervals) which determine whether
--      the load on the least-loaded cluster could be redistributed to the other clusters

-- Economy: Favors conserving credits rather than starting additional warehouses
--      Cluster starts only if:
--      * The system estimates there's enough query load to keep the cluster busy at least 6 minutes
--      Cluster shuts down after 5 or 6 succesful checks (1 min invervals) which determine whether
--      the load on the least-loaded cluster could be redistributed to the other clusters

CREATE WAREHOUSE mywh WITH MAX_CLUSTER_COUNT = 2, SCALING_POLICY = 'STANDARD';
ALTER WAREHOUSE mywh SET SCALING_POLICY = 'ECONOMY';
