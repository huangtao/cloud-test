.class public Lcom/boyaa/entity/common/FPSController;
.super Ljava/lang/Object;
.source "FPSController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/entity/common/FPSController$Mean;
    }
.end annotation


# static fields
.field private static fps:I

.field private static lastTime:J

.field private static mean:Lcom/boyaa/entity/common/FPSController$Mean;

.field private static sleep:Z

.field private static tps:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    const/4 v0, 0x1

    sput-boolean v0, Lcom/boyaa/entity/common/FPSController;->sleep:Z

    .line 49
    const/16 v0, 0x3c

    sput v0, Lcom/boyaa/entity/common/FPSController;->fps:I

    .line 50
    new-instance v0, Lcom/boyaa/entity/common/FPSController$Mean;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Lcom/boyaa/entity/common/FPSController$Mean;-><init>(I)V

    sput-object v0, Lcom/boyaa/entity/common/FPSController;->mean:Lcom/boyaa/entity/common/FPSController$Mean;

    .line 51
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/boyaa/entity/common/FPSController;->lastTime:J

    .line 52
    const v0, 0x3b9aca00

    sget v1, Lcom/boyaa/entity/common/FPSController;->fps:I

    div-int/2addr v0, v1

    sput v0, Lcom/boyaa/entity/common/FPSController;->tps:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onDrawFrame()V
    .locals 10

    .prologue
    .line 82
    sget-boolean v6, Lcom/boyaa/entity/common/FPSController;->sleep:Z

    if-nez v6, :cond_0

    .line 96
    .local v0, "delta":J
    .local v2, "time":J
    .local v4, "value":J
    :goto_0
    return-void

    .line 85
    .end local v0    # "delta":J
    .end local v2    # "time":J
    .end local v4    # "value":J
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 86
    .restart local v2    # "time":J
    sget-wide v6, Lcom/boyaa/entity/common/FPSController;->lastTime:J

    sub-long v0, v2, v6

    .line 87
    .restart local v0    # "delta":J
    sget-object v6, Lcom/boyaa/entity/common/FPSController;->mean:Lcom/boyaa/entity/common/FPSController$Mean;

    long-to-int v7, v0

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8}, Lcom/boyaa/entity/common/FPSController$Mean;->add(J)V

    .line 88
    sget-object v6, Lcom/boyaa/entity/common/FPSController;->mean:Lcom/boyaa/entity/common/FPSController$Mean;

    invoke-virtual {v6}, Lcom/boyaa/entity/common/FPSController$Mean;->get()J

    move-result-wide v4

    .line 89
    .restart local v4    # "value":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_1

    sget v6, Lcom/boyaa/entity/common/FPSController;->tps:I

    int-to-long v6, v6

    cmp-long v6, v6, v4

    if-lez v6, :cond_1

    .line 90
    sget v6, Lcom/boyaa/entity/common/FPSController;->tps:I

    int-to-long v6, v6

    sub-long/2addr v6, v4

    const-wide/32 v8, 0xf4240

    div-long/2addr v6, v8

    invoke-static {v6, v7}, Landroid/os/SystemClock;->sleep(J)V

    .line 92
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sput-wide v6, Lcom/boyaa/entity/common/FPSController;->lastTime:J

    goto :goto_0
.end method

.method public static onSurfaceCreated()V
    .locals 2

    .prologue
    .line 77
    sget-object v0, Lcom/boyaa/entity/common/FPSController;->mean:Lcom/boyaa/entity/common/FPSController$Mean;

    invoke-virtual {v0}, Lcom/boyaa/entity/common/FPSController$Mean;->clear()V

    .line 78
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sput-wide v0, Lcom/boyaa/entity/common/FPSController;->lastTime:J

    .line 79
    return-void
.end method

.method public static setFPS(I)V
    .locals 3
    .param p0, "fps"    # I

    .prologue
    .line 55
    if-gtz p0, :cond_0

    .line 56
    const/16 p0, 0x3c

    .line 65
    :cond_0
    const/16 v0, 0x3c

    if-lt p0, v0, :cond_1

    .line 66
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/entity/common/FPSController;->sleep:Z

    .line 70
    :goto_0
    sput p0, Lcom/boyaa/entity/common/FPSController;->fps:I

    .line 71
    const v0, 0x3b9aca00

    div-int/2addr v0, p0

    sput v0, Lcom/boyaa/entity/common/FPSController;->tps:I

    .line 73
    const-string v0, "gaojie"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "fps"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return-void

    .line 68
    :cond_1
    const/4 v0, 0x1

    sput-boolean v0, Lcom/boyaa/entity/common/FPSController;->sleep:Z

    goto :goto_0
.end method
