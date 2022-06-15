<?php

namespace nanodb;

class EReg
{
    /**
     * @var bool
     */
    public $global;

    /**
     * @var string
     */
    public $last;

    /**
     * @var mixed
     */
    public $matches;

    /**
     * @var string
     */
    public $options;

    /**
     * @var string
     */
    public $pattern;

    /**
     * @var mixed
     */
    public $r;

    /**
     * @var string
     */
    public $re;

    /**
     * @param string $s
     * @return string
     */
    public static function escape($s)
    {
        return preg_quote($s);
    }

    /**
     * @param string $r
     * @param string $opt
     */
    public function __construct($r, $opt)
    {
        $this->pattern = $r;
        $this->options = str_replace('g', '', $opt);
        $this->global = $this->options !== $opt;
        $this->re = '"' . (str_replace('"', "\\\"", $r) ?? 'null') . '"u' . $this->options;
    }

    /**
     * @param string $s
     * @param \Closure $f
     * @return string
     */
    public function map($s, $f)
    {
        $offset = 0;
        $buf = '';
        $length = mb_strlen($s);
        while (true) {
            if ($offset >= $length) {
                break;
            }

            if (!$this->matchSub($s, $offset)) {
                $buf .= (mb_substr($s, $offset, null) ?? 'null');
                break;
            }
            $p = $this->matchedPosAssoc();
            $buf .= (mb_substr($s, $offset, $p['pos'] - $offset) ?? 'null');
            $buf .= $f($this);
            if ($p['len'] === 0) {
                $buf .= (mb_substr($s, $p['pos'], 1) ?? 'null');
                $offset = $p['pos'] + 1;
            }
            else {
                $offset = $p['pos'] + $p['len'];
            }
            if (!$this->global) {
                break;
            }
        }
        if (!$this->global && ($offset > 0) && ($offset < $length)) {
            $buf .= (mb_substr($s, $offset, null) ?? 'null');
        }
        return $buf;
    }

    /**
     * @param string $s
     * @return bool
     */
    public function match($s)
    {
        $p = preg_match($this->re, $s, $this->matches, PREG_OFFSET_CAPTURE);
        $this->last = $p > 0 ? $s : null;
        return $p > 0;
    }

    /**
     * @param string $s
     * @param int $pos
     * @param int $len
     * @return bool
     */
    public function matchSub($s, $pos, $len = -1)
    {
        if ($len === null) $len = -1;

        $subject = ($len < 0 ? $s : mb_substr($s, 0, $pos + $len));
        $p = preg_match($this->re, $subject, $this->matches, PREG_OFFSET_CAPTURE, $pos);
        $this->last = $p > 0 ? $s : null;
        return $p > 0;
    }

    /**
     * @param int $n
     * @return string
     */
    public function matched($n)
    {
        if ($this->matches === null || $n < 0) throw new \Exception('EReg::matched');
        if ($n >= \count($this->matches)) return null;
        if ($this->matches[$n][1] < 0) return null;
        return $this->matches[$n][0];
    }

    /**
     * @return string
     */
    public function matchedLeft()
    {
        if (\count($this->matches) === 0) throw new \Exception('No string matched');
        return substr($this->last, 0, $this->matches[0][1]);
    }

    /**
     * @return mixed
     */
    public function matchedPosAssoc()
    {
        $tmp = mb_strlen(substr($this->last, 0, $this->matches[0][1]));
        return [
            'pos' => $tmp,
            'len' => mb_strlen($this->matches[0][0]),
        ];
    }

    /**
     * @return string
     */
    public function matchedRight()
    {
        if (\count($this->matches) === 0) throw new \Exception('No string matched');
        $x = $this->matches[0][1] + \strlen($this->matches[0][0]);
        return substr($this->last, $x);
    }

    /**
     * @param string $s
     * @param string $by
     * @return string
     */
    public function replace($s, $by)
    {
        $by = str_replace(["\\\$", '$$'], ["\\\\\$", "\\\$"], $by);
        if (!preg_match("/\\\\([^?].*?\\\\)/", $this->re)) {
            $by = preg_replace("/\\\$(\\d+)/", "\\\$\\1", $by);
        }
        return preg_replace($this->re, $by, $s, $this->global ? -1 : 1);
    }

    /**
     * @param string $s
     * @return mixed
     */
    public function splitAssoc($s)
    {
        return preg_split($this->re, $s, $this->global ? -1 : 2);
    }
}

