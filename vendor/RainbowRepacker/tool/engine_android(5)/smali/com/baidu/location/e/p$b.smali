.class Lcom/baidu/location/e/p$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/baidu/location/e/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/baidu/location/e/p;

.field public do:I

.field public for:I

.field public if:I

.field public int:C

.field public new:I


# direct methods
.method private constructor <init>(Lcom/baidu/location/e/p;)V
    .locals 1

    const/4 v0, -0x1

    iput-object p1, p0, Lcom/baidu/location/e/p$b;->a:Lcom/baidu/location/e/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/baidu/location/e/p$b;->for:I

    iput v0, p0, Lcom/baidu/location/e/p$b;->new:I

    iput v0, p0, Lcom/baidu/location/e/p$b;->do:I

    iput v0, p0, Lcom/baidu/location/e/p$b;->if:I

    const/4 v0, 0x0

    iput-char v0, p0, Lcom/baidu/location/e/p$b;->int:C

    return-void
.end method

.method synthetic constructor <init>(Lcom/baidu/location/e/p;Lcom/baidu/location/e/p$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/baidu/location/e/p$b;-><init>(Lcom/baidu/location/e/p;)V

    return-void
.end method

.method static synthetic a(Lcom/baidu/location/e/p$b;)Z
    .locals 1

    invoke-direct {p0}, Lcom/baidu/location/e/p$b;->do()Z

    move-result v0

    return v0
.end method

.method private do()Z
    .locals 2

    iget v0, p0, Lcom/baidu/location/e/p$b;->for:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/baidu/location/e/p$b;->new:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 2

    invoke-direct {p0}, Lcom/baidu/location/e/p$b;->do()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iget v1, p0, Lcom/baidu/location/e/p$b;->new:I

    add-int/lit8 v1, v1, 0x17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "H"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/baidu/location/e/p$b;->for:I

    add-int/lit8 v1, v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/baidu/location/e/p$b;->if:I

    add-int/lit8 v1, v1, 0x36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "Q"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/baidu/location/e/p$b;->do:I

    add-int/lit16 v1, v1, 0xcb

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public if()I
    .locals 2

    const/4 v0, 0x2

    iget v1, p0, Lcom/baidu/location/e/p$b;->do:I

    if-lez v1, :cond_1

    invoke-direct {p0}, Lcom/baidu/location/e/p$b;->do()Z

    move-result v1

    if-eqz v1, :cond_1

    iget v0, p0, Lcom/baidu/location/e/p$b;->do:I

    const/16 v1, 0x1cc

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/baidu/location/e/p$b;->do:I

    const/16 v1, 0x1c6

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/baidu/location/e/p$b;->do:I

    const/16 v1, 0x1c7

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/baidu/location/e/p$b;->do:I

    const/16 v1, 0x1d2

    if-ne v0, v1, :cond_2

    :cond_0
    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    invoke-direct {p0}, Lcom/baidu/location/e/p$b;->do()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    const-string v1, "&nw="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-char v1, p0, Lcom/baidu/location/e/p$b;->int:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    const-string v2, "&cl=%d|%d|%d|%d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/baidu/location/e/p$b;->do:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/baidu/location/e/p$b;->if:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget v5, p0, Lcom/baidu/location/e/p$b;->for:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget v5, p0, Lcom/baidu/location/e/p$b;->new:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
