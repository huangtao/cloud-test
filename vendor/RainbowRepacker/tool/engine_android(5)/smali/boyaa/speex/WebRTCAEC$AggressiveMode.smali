.class public final Lboyaa/speex/WebRTCAEC$AggressiveMode;
.super Ljava/lang/Object;
.source "WebRTCAEC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lboyaa/speex/WebRTCAEC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AggressiveMode"
.end annotation


# static fields
.field public static final AGGRESSIVE:Lboyaa/speex/WebRTCAEC$AggressiveMode;

.field public static final HIGH:Lboyaa/speex/WebRTCAEC$AggressiveMode;

.field public static final MEDIUM:Lboyaa/speex/WebRTCAEC$AggressiveMode;

.field public static final MILD:Lboyaa/speex/WebRTCAEC$AggressiveMode;

.field public static final MOST_AGGRESSIVE:Lboyaa/speex/WebRTCAEC$AggressiveMode;


# instance fields
.field private final mMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 66
    new-instance v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 67
    const/4 v1, 0x0

    .line 66
    invoke-direct {v0, v1}, Lboyaa/speex/WebRTCAEC$AggressiveMode;-><init>(I)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->MILD:Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 72
    new-instance v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 73
    const/4 v1, 0x1

    .line 72
    invoke-direct {v0, v1}, Lboyaa/speex/WebRTCAEC$AggressiveMode;-><init>(I)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->MEDIUM:Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 78
    new-instance v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 79
    const/4 v1, 0x2

    .line 78
    invoke-direct {v0, v1}, Lboyaa/speex/WebRTCAEC$AggressiveMode;-><init>(I)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->HIGH:Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 84
    new-instance v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 85
    const/4 v1, 0x3

    .line 84
    invoke-direct {v0, v1}, Lboyaa/speex/WebRTCAEC$AggressiveMode;-><init>(I)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->AGGRESSIVE:Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 90
    new-instance v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 91
    const/4 v1, 0x4

    .line 90
    invoke-direct {v0, v1}, Lboyaa/speex/WebRTCAEC$AggressiveMode;-><init>(I)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->MOST_AGGRESSIVE:Lboyaa/speex/WebRTCAEC$AggressiveMode;

    .line 91
    return-void
.end method

.method private constructor <init>(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput p1, p0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->mMode:I

    .line 97
    return-void
.end method


# virtual methods
.method public getMode()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->mMode:I

    return v0
.end method
