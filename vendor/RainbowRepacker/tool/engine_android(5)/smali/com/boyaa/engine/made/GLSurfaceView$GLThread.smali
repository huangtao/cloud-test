.class Lcom/boyaa/engine/made/GLSurfaceView$GLThread;
.super Ljava/lang/Thread;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GLThread"
.end annotation


# instance fields
.field private mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mFinishedCreatingEglSurface:Z

.field private mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/boyaa/engine/made/GLSurfaceView;",
            ">;"
        }
    .end annotation
.end field

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mShouldReleaseEglContext:Z

.field private mSizeChanged:Z

.field private mSurfaceIsBad:Z

.field private mWaitingForSurface:Z

.field private mWidth:I


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/boyaa/engine/made/GLSurfaceView;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "glSurfaceViewWeakRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/boyaa/engine/made/GLSurfaceView;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1222
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1758
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 1759
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 1223
    iput v2, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWidth:I

    .line 1224
    iput v2, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHeight:I

    .line 1225
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1226
    iput v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderMode:I

    .line 1227
    iput-object p1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 1228
    return-void
.end method

.method static synthetic access$1102(Lcom/boyaa/engine/made/GLSurfaceView$GLThread;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/boyaa/engine/made/GLSurfaceView$GLThread;
    .param p1, "x1"    # Z

    .prologue
    .line 1220
    iput-boolean p1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z

    return p1
.end method

.method private guardedRun()V
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1269
    new-instance v20, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v21, v0

    invoke-direct/range {v20 .. v21}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;-><init>(Ljava/lang/ref/WeakReference;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    .line 1270
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1271
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1273
    const/4 v8, 0x0

    .line 1274
    .local v8, "gl":Ljavax/microedition/khronos/opengles/GL10;
    const/4 v3, 0x0

    .line 1275
    .local v3, "createEglContext":Z
    const/4 v4, 0x0

    .line 1276
    .local v4, "createEglSurface":Z
    const/4 v5, 0x0

    .line 1277
    .local v5, "createGlInterface":Z
    const/4 v10, 0x0

    .line 1278
    .local v10, "lostEglContext":Z
    const/4 v14, 0x0

    .line 1279
    .local v14, "sizeChanged":Z
    const/16 v19, 0x0

    .line 1280
    .local v19, "wantRenderNotification":Z
    const/4 v6, 0x0

    .line 1281
    .local v6, "doRenderNotification":Z
    const/4 v2, 0x0

    .line 1282
    .local v2, "askedToReleaseEglContext":Z
    const/16 v18, 0x0

    .line 1283
    .local v18, "w":I
    const/4 v9, 0x0

    .line 1284
    .local v9, "h":I
    const/4 v7, 0x0

    .line 1287
    .local v7, "event":Ljava/lang/Runnable;
    :cond_0
    :goto_0
    :try_start_0
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1289
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mShouldExit:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1

    .line 1290
    monitor-exit v21
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1562
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v21

    monitor-enter v21

    .line 1563
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1564
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1565
    monitor-exit v21
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    .line 1290
    return-void

    .line 1293
    :cond_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v20

    if-nez v20, :cond_2

    .line 1294
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Ljava/lang/Runnable;

    move-object v7, v0

    .line 1458
    :goto_2
    monitor-exit v21
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1460
    if-eqz v7, :cond_14

    .line 1461
    :try_start_4
    invoke-interface {v7}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1462
    const/4 v7, 0x0

    .line 1463
    goto :goto_0

    .line 1299
    :cond_2
    const/4 v11, 0x0

    .line 1300
    .local v11, "pausing":Z
    :try_start_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mPaused:Z

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestPaused:Z

    move/from16 v22, v0

    move/from16 v0, v20

    move/from16 v1, v22

    if-eq v0, v1, :cond_3

    .line 1301
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestPaused:Z

    .line 1302
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestPaused:Z

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mPaused:Z

    .line 1303
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1310
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mShouldReleaseEglContext:Z

    move/from16 v20, v0

    if-eqz v20, :cond_4

    .line 1314
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1315
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1316
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mShouldReleaseEglContext:Z

    .line 1317
    const/4 v2, 0x1

    .line 1321
    :cond_4
    if-eqz v10, :cond_5

    .line 1322
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1323
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1324
    const/4 v10, 0x0

    .line 1328
    :cond_5
    if-eqz v11, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_6

    .line 1332
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1336
    :cond_6
    if-eqz v11, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    move/from16 v20, v0

    if-eqz v20, :cond_8

    .line 1337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/boyaa/engine/made/GLSurfaceView;

    .line 1338
    .local v17, "view":Lcom/boyaa/engine/made/GLSurfaceView;
    if-nez v17, :cond_11

    const/4 v12, 0x0

    .line 1340
    .local v12, "preserveEglContextOnPause":Z
    :goto_3
    if-eqz v12, :cond_7

    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v20

    if-eqz v20, :cond_8

    .line 1341
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1349
    .end local v12    # "preserveEglContextOnPause":Z
    .end local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :cond_8
    if-eqz v11, :cond_9

    .line 1350
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v20

    if-eqz v20, :cond_9

    .line 1351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->finish()V

    .line 1359
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHasSurface:Z

    move/from16 v20, v0

    if-nez v20, :cond_b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    move/from16 v20, v0

    if-nez v20, :cond_b

    .line 1363
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_a

    .line 1364
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1366
    :cond_a
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1367
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSurfaceIsBad:Z

    .line 1368
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1372
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHasSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_c

    .line 1376
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1377
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1380
    :cond_c
    if-eqz v6, :cond_d

    .line 1384
    const/16 v19, 0x0

    .line 1385
    const/4 v6, 0x0

    .line 1386
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1387
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1391
    :cond_d
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->readyToDraw()Z

    move-result v20

    if-eqz v20, :cond_13

    .line 1394
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    move/from16 v20, v0

    if-nez v20, :cond_e

    .line 1395
    if-eqz v2, :cond_12

    .line 1396
    const/4 v2, 0x0

    .line 1411
    :cond_e
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    move/from16 v20, v0

    if-eqz v20, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-nez v20, :cond_f

    .line 1412
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1413
    const/4 v4, 0x1

    .line 1414
    const/4 v5, 0x1

    .line 1415
    const/4 v14, 0x1

    .line 1418
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_13

    .line 1419
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSizeChanged:Z

    move/from16 v20, v0

    if-eqz v20, :cond_10

    .line 1420
    const/4 v14, 0x1

    .line 1421
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWidth:I

    move/from16 v18, v0

    .line 1422
    move-object/from16 v0, p0

    iget v9, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHeight:I

    .line 1423
    const/16 v19, 0x1

    .line 1431
    const/4 v4, 0x1

    .line 1433
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 1435
    :cond_10
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1436
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_2

    .line 1458
    .end local v11    # "pausing":Z
    :catchall_0
    move-exception v20

    monitor-exit v21
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v20
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 1562
    :catchall_1
    move-exception v20

    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v21

    monitor-enter v21

    .line 1563
    :try_start_7
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1564
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1565
    monitor-exit v21
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 1562
    throw v20

    .line 1338
    .restart local v11    # "pausing":Z
    .restart local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :cond_11
    :try_start_8
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->mPreserveEGLContextOnPause:Z
    invoke-static/range {v17 .. v17}, Lcom/boyaa/engine/made/GLSurfaceView;->access$900(Lcom/boyaa/engine/made/GLSurfaceView;)Z

    move-result v12

    goto/16 :goto_3

    .line 1397
    .end local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :cond_12
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/boyaa/engine/made/GLSurfaceView$GLThread;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-result v20

    if-eqz v20, :cond_e

    .line 1399
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->start()V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 1404
    const/16 v20, 0x1

    :try_start_a
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1405
    const/4 v3, 0x1

    .line 1407
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_4

    .line 1400
    :catch_0
    move-exception v16

    .line 1401
    .local v16, "t":Ljava/lang/RuntimeException;
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/boyaa/engine/made/GLSurfaceView$GLThread;)V

    .line 1402
    throw v16

    .line 1456
    .end local v16    # "t":Ljava/lang/RuntimeException;
    :cond_13
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->wait()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_1

    .line 1466
    .end local v11    # "pausing":Z
    :cond_14
    if-eqz v4, :cond_15

    .line 1470
    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->createSurface()Z

    move-result v20

    if-eqz v20, :cond_1d

    .line 1471
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 1472
    const/16 v20, 0x1

    :try_start_c
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1473
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1474
    monitor-exit v21
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 1483
    const/4 v4, 0x0

    .line 1486
    :cond_15
    if-eqz v5, :cond_16

    .line 1487
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->createGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    move-object v8, v0

    .line 1489
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1490
    const/4 v5, 0x0

    .line 1493
    :cond_16
    if-eqz v3, :cond_18

    .line 1497
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/boyaa/engine/made/GLSurfaceView;

    .line 1498
    .restart local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    if-eqz v17, :cond_17

    .line 1499
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->mRenderer:Lcom/boyaa/engine/made/GLSurfaceView$Renderer;
    invoke-static/range {v17 .. v17}, Lcom/boyaa/engine/made/GLSurfaceView;->access$1000(Lcom/boyaa/engine/made/GLSurfaceView;)Lcom/boyaa/engine/made/GLSurfaceView$Renderer;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v8, v1}, Lcom/boyaa/engine/made/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1501
    :cond_17
    const/4 v3, 0x0

    .line 1504
    .end local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :cond_18
    if-eqz v14, :cond_1a

    .line 1508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/boyaa/engine/made/GLSurfaceView;

    .line 1509
    .restart local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    if-eqz v17, :cond_19

    .line 1510
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->mRenderer:Lcom/boyaa/engine/made/GLSurfaceView$Renderer;
    invoke-static/range {v17 .. v17}, Lcom/boyaa/engine/made/GLSurfaceView;->access$1000(Lcom/boyaa/engine/made/GLSurfaceView;)Lcom/boyaa/engine/made/GLSurfaceView$Renderer;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v18

    invoke-interface {v0, v8, v1, v9}, Lcom/boyaa/engine/made/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1512
    :cond_19
    const/4 v14, 0x0

    .line 1520
    .end local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :cond_1a
    const/4 v13, 0x0

    .line 1522
    .local v13, "reDrawed":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/boyaa/engine/made/GLSurfaceView;

    .line 1523
    .restart local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    if-eqz v17, :cond_1b

    .line 1524
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->mRenderer:Lcom/boyaa/engine/made/GLSurfaceView$Renderer;
    invoke-static/range {v17 .. v17}, Lcom/boyaa/engine/made/GLSurfaceView;->access$1000(Lcom/boyaa/engine/made/GLSurfaceView;)Lcom/boyaa/engine/made/GLSurfaceView$Renderer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v8}, Lcom/boyaa/engine/made/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)Z

    move-result v13

    .line 1528
    :cond_1b
    if-eqz v13, :cond_1c

    .line 1529
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->swap()I

    move-result v15

    .line 1530
    .local v15, "swapError":I
    sparse-switch v15, :sswitch_data_0

    .line 1544
    const-string v20, "GLThread"

    const-string v21, "eglSwapBuffers"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v15}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->logEglErrorAsWarning(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1546
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 1547
    const/16 v20, 0x1

    :try_start_e
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSurfaceIsBad:Z

    .line 1548
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1549
    monitor-exit v21
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 1553
    .end local v15    # "swapError":I
    :cond_1c
    :goto_5
    :sswitch_0
    if-eqz v19, :cond_0

    .line 1554
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 1474
    .end local v13    # "reDrawed":Z
    .end local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :catchall_2
    move-exception v20

    :try_start_f
    monitor-exit v21
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    :try_start_10
    throw v20

    .line 1476
    :cond_1d
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 1477
    const/16 v20, 0x1

    :try_start_11
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1478
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSurfaceIsBad:Z

    .line 1479
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->notifyAll()V

    .line 1480
    monitor-exit v21

    goto/16 :goto_0

    :catchall_3
    move-exception v20

    monitor-exit v21
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    :try_start_12
    throw v20
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 1537
    .restart local v13    # "reDrawed":Z
    .restart local v15    # "swapError":I
    .restart local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :sswitch_1
    const/4 v10, 0x1

    .line 1538
    goto :goto_5

    .line 1549
    :catchall_4
    move-exception v20

    :try_start_13
    monitor-exit v21
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    :try_start_14
    throw v20
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 1565
    .end local v13    # "reDrawed":Z
    .end local v15    # "swapError":I
    .end local v17    # "view":Lcom/boyaa/engine/made/GLSurfaceView;
    :catchall_5
    move-exception v20

    :try_start_15
    monitor-exit v21
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    throw v20

    :catchall_6
    move-exception v20

    :try_start_16
    monitor-exit v21
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    throw v20

    .line 1530
    nop

    :sswitch_data_0
    .sparse-switch
        0x3000 -> :sswitch_0
        0x300e -> :sswitch_1
    .end sparse-switch
.end method

.method private readyToDraw()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1574
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mPaused:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSurfaceIsBad:Z

    if-nez v1, :cond_1

    iget v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWidth:I

    if-lez v1, :cond_1

    iget v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHeight:I

    if-lez v1, :cond_1

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestRender:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderMode:I

    if-ne v1, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private stopEglContextLocked()V
    .locals 1

    .prologue
    .line 1262
    iget-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    .line 1263
    iget-object v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->finish()V

    .line 1264
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1265
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/boyaa/engine/made/GLSurfaceView$GLThread;)V

    .line 1267
    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .prologue
    .line 1251
    iget-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    .line 1252
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1253
    iget-object v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEglHelper:Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/GLSurfaceView$EglHelper;->destroySurface()V

    .line 1255
    :cond_0
    return-void
.end method


# virtual methods
.method public ableToDraw()Z
    .locals 1

    .prologue
    .line 1570
    iget-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->readyToDraw()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRenderMode()I
    .locals 2

    .prologue
    .line 1590
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1591
    :try_start_0
    iget v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderMode:I

    monitor-exit v1

    return v0

    .line 1592
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 1640
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1644
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestPaused:Z

    .line 1645
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1646
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1651
    :try_start_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1652
    :catch_0
    move-exception v0

    .line 1653
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1656
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1657
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 1660
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1664
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestPaused:Z

    .line 1665
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1666
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1667
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1668
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1673
    :try_start_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1674
    :catch_0
    move-exception v0

    .line 1675
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1678
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1679
    return-void
.end method

.method public onWindowResize(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 1682
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1683
    :try_start_0
    iput p1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWidth:I

    .line 1684
    iput p2, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHeight:I

    .line 1685
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 1686
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1687
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1688
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1692
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mPaused:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderComplete:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->ableToDraw()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 1697
    :try_start_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1698
    :catch_0
    move-exception v0

    .line 1699
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1702
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1703
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 1731
    if-nez p1, :cond_0

    .line 1732
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "r must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1734
    :cond_0
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1735
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1736
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1737
    monitor-exit v1

    .line 1738
    return-void

    .line 1737
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public requestExitAndWait()V
    .locals 3

    .prologue
    .line 1708
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1709
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mShouldExit:Z

    .line 1710
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1711
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1713
    :try_start_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1714
    :catch_0
    move-exception v0

    .line 1715
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1718
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1719
    return-void
.end method

.method public requestReleaseEglContextLocked()V
    .locals 1

    .prologue
    .line 1722
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mShouldReleaseEglContext:Z

    .line 1723
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1724
    return-void
.end method

.method public requestRender()V
    .locals 2

    .prologue
    .line 1596
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1597
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1598
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1599
    monitor-exit v1

    .line 1600
    return-void

    .line 1599
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 1232
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GLThread "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->setName(Ljava/lang/String;)V

    .line 1238
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1242
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    :goto_0
    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/boyaa/engine/made/GLSurfaceView$GLThread;)V

    .line 1244
    return-void

    .line 1242
    :catchall_0
    move-exception v0

    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/boyaa/engine/made/GLSurfaceView$GLThread;)V

    throw v0

    .line 1239
    :catch_0
    move-exception v0

    .line 1242
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    goto :goto_0
.end method

.method public setRenderMode(I)V
    .locals 2
    .param p1, "renderMode"    # I

    .prologue
    .line 1580
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-le p1, v0, :cond_1

    .line 1581
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1583
    :cond_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1584
    :try_start_0
    iput p1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mRenderMode:I

    .line 1585
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1586
    monitor-exit v1

    .line 1587
    return-void

    .line 1586
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceCreated()V
    .locals 3

    .prologue
    .line 1603
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1607
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1608
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1609
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1612
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mFinishedCreatingEglSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1614
    :try_start_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1615
    :catch_0
    move-exception v0

    .line 1616
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1619
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1620
    return-void
.end method

.method public surfaceDestroyed()V
    .locals 3

    .prologue
    .line 1623
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1627
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1628
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1629
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/boyaa/engine/made/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1631
    :try_start_1
    # getter for: Lcom/boyaa/engine/made/GLSurfaceView;->sGLThreadManager:Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;
    invoke-static {}, Lcom/boyaa/engine/made/GLSurfaceView;->access$800()Lcom/boyaa/engine/made/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1632
    :catch_0
    move-exception v0

    .line 1633
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1636
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1637
    return-void
.end method
