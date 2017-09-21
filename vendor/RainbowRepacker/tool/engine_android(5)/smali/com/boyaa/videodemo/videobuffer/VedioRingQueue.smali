.class public Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;
.super Ljava/lang/Object;
.source "VedioRingQueue.java"


# static fields
.field private static mSynlock:[B


# instance fields
.field private final TAG:Ljava/lang/String;

.field private m_ring:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/boyaa/videodemo/bean/VedioBean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->mSynlock:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, "VedioRingQueue"

    iput-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->TAG:Ljava/lang/String;

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    .line 8
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 28
    sget-object v1, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->mSynlock:[B

    monitor-enter v1

    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 28
    monitor-exit v1

    .line 32
    return-void

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getSize()I
    .locals 2

    .prologue
    .line 36
    sget-object v1, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->mSynlock:[B

    monitor-enter v1

    .line 38
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public get_first_data()Lcom/boyaa/videodemo/bean/VedioBean;
    .locals 7

    .prologue
    .line 44
    sget-object v4, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->mSynlock:[B

    monitor-enter v4

    .line 46
    :try_start_0
    new-instance v0, Lcom/boyaa/videodemo/bean/VedioBean;

    invoke-direct {v0}, Lcom/boyaa/videodemo/bean/VedioBean;-><init>()V

    .line 48
    .local v0, "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 49
    :cond_0
    monitor-exit v4

    const/4 v0, 0x0

    .line 64
    .end local v0    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    :goto_0
    return-object v0

    .line 52
    .restart local v0    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    :cond_1
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/videodemo/bean/VedioBean;

    iget-object v3, v3, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v1, v3

    .line 53
    .local v1, "iLength":I
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/videodemo/bean/VedioBean;

    iget-boolean v3, v3, Lcom/boyaa/videodemo/bean/VedioBean;->bShow:Z

    iput-boolean v3, v0, Lcom/boyaa/videodemo/bean/VedioBean;->bShow:Z

    .line 54
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/videodemo/bean/VedioBean;

    iget-wide v5, v3, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    iput-wide v5, v0, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    .line 55
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/videodemo/bean/VedioBean;

    iget v3, v3, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I

    iput v3, v0, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I

    .line 56
    new-array v2, v1, [B

    .line 57
    .local v2, "message":[B
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/videodemo/bean/VedioBean;

    iget-object v3, v3, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v5, v2, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    iput-object v2, v0, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    .line 60
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/videodemo/bean/VedioBean;

    iget-object v3, v3, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v3, v3

    if-eqz v3, :cond_2

    .line 62
    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 64
    :cond_2
    monitor-exit v4

    goto :goto_0

    .line 44
    .end local v0    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    .end local v1    # "iLength":I
    .end local v2    # "message":[B
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V
    .locals 4
    .param p1, "bean"    # Lcom/boyaa/videodemo/bean/VedioBean;

    .prologue
    .line 18
    sget-object v1, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->mSynlock:[B

    monitor-enter v1

    .line 20
    :try_start_0
    iget-object v0, p1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v0, v0

    if-lez v0, :cond_0

    .line 21
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    const-string v0, "VedioRingQueue"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "push_back size : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->m_ring:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    :cond_0
    monitor-exit v1

    .line 25
    return-void

    .line 18
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
