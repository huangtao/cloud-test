.class Lcom/boyaa/entity/common/FPSController$Mean;
.super Ljava/lang/Object;
.source "FPSController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/common/FPSController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Mean"
.end annotation


# instance fields
.field private count:I

.field private data:[J

.field private full:Z

.field private index:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    .line 15
    iput p1, p0, Lcom/boyaa/entity/common/FPSController$Mean;->count:I

    .line 16
    new-array v0, p1, [J

    iput-object v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->data:[J

    .line 17
    return-void
.end method


# virtual methods
.method public add(J)V
    .locals 2
    .param p1, "value"    # J

    .prologue
    .line 20
    iget v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    iget-object v1, p0, Lcom/boyaa/entity/common/FPSController$Mean;->data:[J

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->data:[J

    iget v1, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    aput-wide p1, v0, v1

    .line 24
    iget v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    .line 25
    iget v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    iget-object v1, p0, Lcom/boyaa/entity/common/FPSController$Mean;->data:[J

    array-length v1, v1

    if-ne v0, v1, :cond_1

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->full:Z

    .line 28
    :cond_1
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->full:Z

    .line 44
    iput v0, p0, Lcom/boyaa/entity/common/FPSController$Mean;->index:I

    .line 45
    return-void
.end method

.method public get()J
    .locals 6

    .prologue
    .line 31
    iget-boolean v2, p0, Lcom/boyaa/entity/common/FPSController$Mean;->full:Z

    if-eqz v2, :cond_1

    .line 32
    const/4 v1, 0x0

    .line 33
    .local v1, "sum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/boyaa/entity/common/FPSController$Mean;->count:I

    if-lt v0, v2, :cond_0

    .line 36
    iget v2, p0, Lcom/boyaa/entity/common/FPSController$Mean;->count:I

    div-int v2, v1, v2

    int-to-long v2, v2

    .line 38
    .end local v0    # "i":I
    .end local v1    # "sum":I
    :goto_1
    return-wide v2

    .line 34
    .restart local v0    # "i":I
    .restart local v1    # "sum":I
    :cond_0
    int-to-long v2, v1

    iget-object v4, p0, Lcom/boyaa/entity/common/FPSController$Mean;->data:[J

    aget-wide v4, v4, v0

    add-long/2addr v2, v4

    long-to-int v1, v2

    .line 33
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 38
    .end local v0    # "i":I
    .end local v1    # "sum":I
    :cond_1
    const-wide/16 v2, 0x0

    goto :goto_1
.end method
