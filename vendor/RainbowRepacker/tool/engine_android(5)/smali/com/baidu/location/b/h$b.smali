.class Lcom/baidu/location/b/h$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/baidu/location/b/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/baidu/location/b/h;

.field do:Lcom/baidu/location/b/h$a;

.field if:Lcom/baidu/location/b/h$a;


# direct methods
.method constructor <init>(Lcom/baidu/location/b/h;Lcom/baidu/location/b/h$a;Lcom/baidu/location/b/h$a;)V
    .locals 0

    iput-object p1, p0, Lcom/baidu/location/b/h$b;->a:Lcom/baidu/location/b/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iput-object p3, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    return-void
.end method


# virtual methods
.method a(Lcom/baidu/location/b/h$a;)Z
    .locals 8

    const-wide v0, 0x3e45798ee2308c3aL    # 1.0E-8

    iget-object v2, p0, Lcom/baidu/location/b/h$b;->a:Lcom/baidu/location/b/h;

    invoke-virtual {p0, p1}, Lcom/baidu/location/b/h$b;->if(Lcom/baidu/location/b/h$a;)D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/baidu/location/b/h;->if(D)I

    move-result v2

    if-nez v2, :cond_0

    iget-wide v2, p1, Lcom/baidu/location/b/h$a;->do:D

    iget-object v4, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v4, v4, Lcom/baidu/location/b/h$a;->do:D

    iget-object v6, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    iget-wide v6, v6, Lcom/baidu/location/b/h$a;->do:D

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    add-double/2addr v4, v0

    cmpg-double v2, v2, v4

    if-gez v2, :cond_0

    iget-wide v2, p1, Lcom/baidu/location/b/h$a;->do:D

    iget-object v4, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v4, v4, Lcom/baidu/location/b/h$a;->do:D

    iget-object v6, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    iget-wide v6, v6, Lcom/baidu/location/b/h$a;->do:D

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    sub-double/2addr v4, v0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_0

    iget-wide v2, p1, Lcom/baidu/location/b/h$a;->if:D

    iget-object v4, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v4, v4, Lcom/baidu/location/b/h$a;->if:D

    iget-object v6, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    iget-wide v6, v6, Lcom/baidu/location/b/h$a;->if:D

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    add-double/2addr v4, v0

    cmpg-double v2, v2, v4

    if-gez v2, :cond_0

    iget-wide v2, p1, Lcom/baidu/location/b/h$a;->if:D

    iget-object v4, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v4, v4, Lcom/baidu/location/b/h$a;->if:D

    iget-object v6, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    iget-wide v6, v6, Lcom/baidu/location/b/h$a;->if:D

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    sub-double v0, v4, v0

    cmpl-double v0, v2, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method if(Lcom/baidu/location/b/h$a;)D
    .locals 9

    new-instance v0, Lcom/baidu/location/b/h$a;

    iget-object v1, p0, Lcom/baidu/location/b/h$b;->a:Lcom/baidu/location/b/h;

    iget-object v2, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    iget-wide v2, v2, Lcom/baidu/location/b/h$a;->do:D

    iget-object v4, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v4, v4, Lcom/baidu/location/b/h$a;->do:D

    sub-double/2addr v2, v4

    iget-object v4, p0, Lcom/baidu/location/b/h$b;->if:Lcom/baidu/location/b/h$a;

    iget-wide v4, v4, Lcom/baidu/location/b/h$a;->if:D

    iget-object v6, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v6, v6, Lcom/baidu/location/b/h$a;->if:D

    sub-double/2addr v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/baidu/location/b/h$a;-><init>(Lcom/baidu/location/b/h;DD)V

    new-instance v1, Lcom/baidu/location/b/h$a;

    iget-object v2, p0, Lcom/baidu/location/b/h$b;->a:Lcom/baidu/location/b/h;

    iget-wide v3, p1, Lcom/baidu/location/b/h$a;->do:D

    iget-object v5, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v5, v5, Lcom/baidu/location/b/h$a;->do:D

    sub-double/2addr v3, v5

    iget-wide v5, p1, Lcom/baidu/location/b/h$a;->if:D

    iget-object v7, p0, Lcom/baidu/location/b/h$b;->do:Lcom/baidu/location/b/h$a;

    iget-wide v7, v7, Lcom/baidu/location/b/h$a;->if:D

    sub-double/2addr v5, v7

    invoke-direct/range {v1 .. v6}, Lcom/baidu/location/b/h$a;-><init>(Lcom/baidu/location/b/h;DD)V

    iget-wide v2, v0, Lcom/baidu/location/b/h$a;->do:D

    iget-wide v4, v1, Lcom/baidu/location/b/h$a;->if:D

    mul-double/2addr v2, v4

    iget-wide v4, v0, Lcom/baidu/location/b/h$a;->if:D

    iget-wide v0, v1, Lcom/baidu/location/b/h$a;->do:D

    mul-double/2addr v0, v4

    sub-double v0, v2, v0

    return-wide v0
.end method
